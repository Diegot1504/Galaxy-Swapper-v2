﻿using Galaxy_Swapper_v2.Workspace.Generation.Formats;
using Galaxy_Swapper_v2.Workspace.Properties;
using Galaxy_Swapper_v2.Workspace.Swapping;
using Galaxy_Swapper_v2.Workspace.Swapping.Other;
using Galaxy_Swapper_v2.Workspace.Swapping.Providers;
using Galaxy_Swapper_v2.Workspace.Utilities;
using Newtonsoft.Json.Linq;
using Serilog;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media.Animation;

namespace Galaxy_Swapper_v2.Workspace.Usercontrols.Overlays
{
    /// <summary>
    /// Interaction logic for FovView.xaml
    /// </summary>
    public partial class FovView : UserControl
    {
        public FovView()
        {
            InitializeComponent();
        }

        private void FovView_Loaded(object sender, RoutedEventArgs e)
        {
            Convert.Content = Languages.Read(Languages.Type.View, "SwapView", "Convert");
            Revert.Content = Languages.Read(Languages.Type.View, "SwapView", "Revert");

            if (SwapLogs.IsSwapped("FOV", true))
            {
                Converted.Text = Languages.Read(Languages.Type.View, "SwapView", "ON");
                Converted.Foreground = Colors.Text;
            }
            else if (Settings.Read(Settings.Type.KickWarning).Value<bool>())
            {
                SwapLogs.Read(out int Count, out int AssetCount, out int Ucas, out int Utoc);
                if (AssetCount + 1 > 13)
                {
                    Message.Display(Languages.Read(Languages.Type.Header, "Warning"), string.Format(Languages.Read(Languages.Type.Message, "MaxAssetCount"), 13), MessageBoxButton.OK);
                    Memory.MainView.RemoveOverlay();
                }
            }
            else
                Converted.Text = Languages.Read(Languages.Type.View, "SwapView", "OFF");

            if (Settings.Read(Settings.Type.CloseFortnite).Value<bool>())
                EpicGamesLauncher.Close();

            var Parse = Endpoint.Read(Endpoint.Type.FOV);

            if (Parse["Message"] != null && !string.IsNullOrEmpty(Parse["Message"].Value<string>()) && Parse["Message"].Value<string>().ToLower() != "false")
                Message.Display(Languages.Read(Languages.Type.Header, "Warning"), Parse["Message"].Value<string>(), MessageBoxButton.OK);

            foreach (var Preview in Parse["Previews"])
            {
                var preview = new Image() { Name = $"Preview{Preview["Amount"].Value<string>()}", Visibility = Visibility.Hidden, Stretch = System.Windows.Media.Stretch.Fill };
                preview.LoadImage(Preview["URL"].Value<string>());
                Previews.Children.Add(preview);

                Log.Information($"Loaded icon for: {Preview["Amount"].Value<string>()}");
            }

            Slider.Value = 80;
            Presence.Update("FOV Changer");
        }

        private void Close_Click(object sender, MouseButtonEventArgs e) => Memory.MainView.RemoveOverlay();
        private void Slider_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            if (Slider != null && Amount != null)
            {
                Slider.Value = Math.Round(e.NewValue / Slider.TickFrequency) * Slider.TickFrequency;
                Amount.Text = string.Format(Languages.Read(Languages.Type.View, "FovView", "Amount"), Slider.Value);

                Previews.Children.OfType<Image>().ToList().ForEach(img => img.Visibility = Visibility.Hidden);
                var image = Previews.Children.OfType<Image>().FirstOrDefault(img => img.Name == $"Preview{Slider.Value}");
                if (image != null)
                    image.Visibility = Visibility.Visible;
            }
        }

        public enum Type
        {
            None, // ?
            Info,
            Warning,
            Error
        }

        public void Output(string Content, Type Type)
        {
            this.Dispatcher.Invoke(() =>
            {
                switch (Type)
                {
                    case Type.Info:
                        LOG.Foreground = Colors.Text;
                        Log.Information(Content);
                        break;
                    case Type.Warning:
                        LOG.Foreground = Colors.Yellow;
                        Log.Warning(Content);
                        break;
                    case Type.Error:
                        LOG.Foreground = Colors.Red;
                        Log.Error(Content);
                        break;
                }

                LOG.Text = Content;

                if (LOG.Text.Length > 64)
                    LOG.FontSize = 10F;
                else
                    LOG.FontSize = 14F;
            });
        }

        private float GetSliderValue()
        {
            double SliderValue = 120; //Set as 120 so if there are errors it's still stretched
            this.Dispatcher.Invoke(() =>
            {
                SliderValue = Slider.Value;
            });
            return (float)SliderValue;
        }

        private BackgroundWorker Worker { get; set; } = default!;
        private void Worker_Click(object sender, RoutedEventArgs e)
        {
            if (Worker != null && Worker.IsBusy)
            {
                Message.Display(Languages.Read(Languages.Type.Header, "Warning"), Languages.Read(Languages.Type.View, "SwapView", "WorkerBusy"), MessageBoxButton.OK);
                return;
            }

            string epicinstallation = Settings.Read(Settings.Type.EpicInstalltion).Value<string>();
            if (string.IsNullOrEmpty(epicinstallation) || !File.Exists(epicinstallation))
            {
                Message.Display(Languages.Read(Languages.Type.Header, "Warning"), Languages.Read(Languages.Type.Message, "EpicGamesLauncherPathEmpty"), MessageBoxButton.OK);
                return;
            }

            EpicGamesLauncher.Close();

            Worker = new BackgroundWorker();
            Worker.RunWorkerCompleted += Worker_Completed;

            if (((Button)sender).Name == "Convert")
                Worker.DoWork += Worker_Convert;
            else
                Worker.DoWork += Worker_Revert;

            Slider.IsEnabled = false;

            var StoryBoard = Interface.SetElementAnimations(new Interface.BaseAnim { Element = Amount, Property = new PropertyPath(Control.OpacityProperty), ElementAnim = new DoubleAnimation() { From = 1, To = 0, Duration = new TimeSpan(0, 0, 0, 0, 100) } }, new Interface.BaseAnim { Element = LOG, Property = new PropertyPath(Control.OpacityProperty), ElementAnim = new DoubleAnimation() { From = 0, To = 1, Duration = new TimeSpan(0, 0, 0, 0, 100), BeginTime = new TimeSpan(0, 0, 0, 0, 100) } });
            StoryBoard.Completed += delegate
            {
                Worker.RunWorkerAsync();
            };
            StoryBoard.Begin();
        }

        private void Worker_Completed(object sender, RunWorkerCompletedEventArgs e)
        {
            Interface.SetElementAnimations(new Interface.BaseAnim { Element = Amount, Property = new PropertyPath(Control.OpacityProperty), ElementAnim = new DoubleAnimation() { From = 0, To = 1, Duration = new TimeSpan(0, 0, 0, 0, 100), BeginTime = new TimeSpan(0, 0, 0, 0, 100) } }, new Interface.BaseAnim { Element = LOG, Property = new PropertyPath(Control.OpacityProperty), ElementAnim = new DoubleAnimation() { From = 1, To = 0, Duration = new TimeSpan(0, 0, 0, 0, 100) } }).Begin();
            Slider.IsEnabled = true;
        }

        private async void Worker_Convert(object sender, DoWorkEventArgs e)
        {
            try
            {
                var Stopwatch = new Stopwatch();
                Stopwatch.Start();

                Output(Languages.Read(Languages.Type.View, "SwapView", "InitializingProvider"), Type.Info);
                CProvider.Initialize();

                List<string> Ucas = new List<string>();
                List<string> Utocs = new List<string>();

                var Parse = Endpoint.Read(Endpoint.Type.FOV);

                if (!Parse["Enabled"].Value<bool>())
                    throw new Exception($"FOV changer is currently disabled!");

                Output(string.Format(Languages.Read(Languages.Type.View, "SwapView", "Exporting"), "Asset"), Type.Info);

                if (!CProvider.Save(Parse["Object"].Value<string>()))
                    throw new Exception($"Failed to export asset");

                var Swaps = new JArray(JObject.FromObject(new
                {
                    type = "hex",
                    search = Parse["Search"].Value<string>(),
                    replace = string.Format(Parse["Replace"].Value<string>(), Misc.ByteToHex(BitConverter.GetBytes(GetSliderValue())))
                }));

                Log.Information(CProvider.Export.Utoc);
                Ucas.AddRange(Ucas.Contains(CProvider.Export.Ucas) ? Enumerable.Empty<string>() : new[] { CProvider.Export.Ucas });
                Utocs.AddRange(Utocs.Contains(CProvider.Export.Utoc) ? Enumerable.Empty<string>() : new[] { CProvider.Export.Utoc });

                if (Settings.Read(Settings.Type.KickWarning).Value<bool>())
                {
                    SwapLogs.Kick(out bool UcasK, out bool UtocK, Ucas, Utocs);

                    if (UtocK)
                    {
                        Message.DisplaySTA(Languages.Read(Languages.Type.Header, "Warning"), string.Format(Languages.Read(Languages.Type.Message, "MaxPakChunkCount"), "Utoc", 2), MessageBoxButton.OK);
                        return;
                    }
                }

                Output(Languages.Read(Languages.Type.View, "SwapView", "ModifyingEpicGamesLauncher"), Type.Info);
                CustomEpicGamesLauncher.Convert();

                Output(Languages.Read(Languages.Type.View, "SwapView", "ConvertingAssets"), Type.Info);

                var Swap = new Swap(null, this, new Asset() { Object = FormatObject(Parse["Object"].Value<string>()), Swaps = Swaps, Export = CProvider.Export });
                if (!Swap.Convert())
                    return;

                SwapLogs.Add($"FOV ({GetSliderValue()})", Parse["SwapIcon"].Value<string>(), Parse["SwapIcon"].Value<string>(), 1, Ucas, Utocs);

                this.Dispatcher.Invoke(() =>
                {
                    Converted.Text = Languages.Read(Languages.Type.View, "SwapView", "ON");
                    Converted.Foreground = Colors.Text;
                });

                TimeSpan TimeSpan = Stopwatch.Elapsed;
                if (TimeSpan.Minutes > 0)
                    Message.DisplaySTA(Languages.Read(Languages.Type.Header, "Info"), string.Format(Languages.Read(Languages.Type.View, "SwapView", "ConvertedMinutes"), TimeSpan.Minutes), MessageBoxButton.OK);
                else
                    Message.DisplaySTA(Languages.Read(Languages.Type.Header, "Info"), string.Format(Languages.Read(Languages.Type.View, "SwapView", "Converted"), TimeSpan.Seconds), MessageBoxButton.OK);
            }
            catch (Global.CustomException CustomException)
            {
                Log.Error(CustomException.Message, "Caught CustomException");
                Message.DisplaySTA(Languages.Read(Languages.Type.Header, "Error"), string.Format(Languages.Read(Languages.Type.Message, "ConvertError"), "FOV", CustomException.Message), MessageBoxButton.OK, new List<string> { Global.Discord });
            }
            catch (Exception Exception)
            {
                Log.Error(Exception.Message, "Caught Exception");
                Message.DisplaySTA(Languages.Read(Languages.Type.Header, "Error"), string.Format(Languages.Read(Languages.Type.Message, "ConvertError"), "FOV", Exception.Message), MessageBoxButton.OK, new List<string> { Global.Discord }, Languages.ReadSolutions(Languages.Type.Message, "ConvertError"));
            }
        }

        private async void Worker_Revert(object sender, DoWorkEventArgs e)
        {
            try
            {
                var Stopwatch = new Stopwatch();
                Stopwatch.Start();

                Output(Languages.Read(Languages.Type.View, "SwapView", "InitializingProvider"), Type.Info);
                CProvider.Initialize();

                var Parse = Endpoint.Read(Endpoint.Type.FOV);

                if (!Parse["Enabled"].Value<bool>())
                    throw new Exception($"FOV changer is currently disabled!");

                Output(string.Format(Languages.Read(Languages.Type.View, "SwapView", "Exporting"), "Asset"), Type.Info);

                if (!CProvider.Save(Parse["Object"].Value<string>()))
                    throw new Exception($"Failed to export asset");

                Output(Languages.Read(Languages.Type.View, "SwapView", "RevertingAssets"), Type.Info);

                var Swap = new Swap(null, this, new Asset() { Object = FormatObject(Parse["Object"].Value<string>()), Export = CProvider.Export });
                if (!Swap.Revert())
                    return;

                SwapLogs.Remove("FOV", true);

                this.Dispatcher.Invoke(() =>
                {
                    Converted.Text = Languages.Read(Languages.Type.View, "SwapView", "OFF");
                    Converted.Foreground = Colors.Text2;
                });

                TimeSpan TimeSpan = Stopwatch.Elapsed;
                if (TimeSpan.Minutes > 0)
                    Message.DisplaySTA(Languages.Read(Languages.Type.Header, "Info"), string.Format(Languages.Read(Languages.Type.View, "SwapView", "RevertedMinutes"), TimeSpan.Minutes), MessageBoxButton.OK);
                else
                    Message.DisplaySTA(Languages.Read(Languages.Type.Header, "Info"), string.Format(Languages.Read(Languages.Type.View, "SwapView", "Reverted"), TimeSpan.Seconds), MessageBoxButton.OK);
            }
            catch (Global.CustomException CustomException)
            {
                Log.Error(CustomException.Message, "Caught CustomException");
                Message.DisplaySTA(Languages.Read(Languages.Type.Header, "Error"), string.Format(Languages.Read(Languages.Type.Message, "RevertError"), "FOV", CustomException.Message), MessageBoxButton.OK, new List<string> { Global.Discord });
            }
            catch (Exception Exception)
            {
                Log.Error(Exception.Message, "Caught Exception");
                Message.DisplaySTA(Languages.Read(Languages.Type.Header, "Error"), string.Format(Languages.Read(Languages.Type.Message, "RevertError"), "FOV", Exception.Message), MessageBoxButton.OK, new List<string> { Global.Discord }, Languages.ReadSolutions(Languages.Type.Message, "ConvertError"));
            }
        }

        private static string FormatObject(string Path) => (Path.Contains('.') ? Path.Split('.').First() : Path).Replace("FortniteGame/Content/", "/Game/").Replace("FortniteGame/Plugins/GameFeatures/BRCosmetics/Content/", "/BRCosmetics/") + ".uasset";
    }
}