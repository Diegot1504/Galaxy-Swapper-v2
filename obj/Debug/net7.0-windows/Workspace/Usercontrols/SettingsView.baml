   M S B A M L   `   `   `  ����L  HGalaxy Swapper v2, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullc6clr-namespace:Galaxy_Swapper_v2.Workspace.Usercontrols(Galaxy_Swapper_v2.Workspace.Usercontrols  5      _4clr-namespace:Galaxy_Swapper_v2.Workspace.Components&Galaxy_Swapper_v2.Workspace.Components  6S   ;    5Galaxy_Swapper_v2.Workspace.Usercontrols.SettingsView   5      W SPresentationCore, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=7.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5      R NSystem.Xaml, Version=7.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      Hlocal6clr-namespace:Galaxy_Swapper_v2.Workspace.Usercontrols     5      K
components4clr-namespace:Galaxy_Swapper_v2.Workspace.Components     6S   -   5        $	��600��5      $	��985��5	      .��5      �� ���#090B0E  �� CornerRadius$  0,0,10,0��6"   ._�5   
   � .+�5      �� $
��Auto=�6   .��5      � .+�5      ��    Settings#��[  6   ._�5      � .+�5      �� -   5         ��Name$ InstallationHeader��5   (   $��Installation��6D   $��13(�6X   $��SemiBold"�6f   ���#EFEFF0 �� TextAlignment$
 Left=�6�   $
��Left=�6�   $	��Top=�6�   $��10, 10, 0, 0q�6�   �� 5      -   5        $ InstallationDescription��5   (   $��10(�6I   $��SemiBold"�6W   ���#454B56$
 Left=�6�   $
��Left=�6�   $	��Top=�6�   $��10, 32, 0, 0q�6�   �� 5      -   5         ��Name$ EditPath��5   %   $��	Edit Path��67   $��603,14,185,14q�6K   6b   �� 5      -   5        $ Verify��5   %   $��Verify��65   $��769,14,19,14q�6F   6\   5      5      �� 5      #��[  6   ._�5      � .+�5      �� -   5        $ EpicInstallationHeader��5   (   $&�� Epic Games Launcher Installation��6H   $��13(�6p   $��SemiBold"�6~   ���#EFEFF0$
 Left=�6�   $
��Left=�6�   $	��Top=�6�   $��10, 10, 0, 0q�6�   �� 5      -   5        $! EpicInstallationDescription��5   (   $��10(�6M   $��SemiBold"�6[   ���#454B56$
 Left=�6�   $
��Left=�6�   $	��Top=�6�   $��10, 32, 0, 0q�6�   �� 5      -   5        $ EpicEditPath��5   %   $��	Edit Path��6;   $��769,14,19,14q�6O   6e   5      5      �� 5      #��[  6   ._�5       � .+�5!      �� -	   5        $ SwapLogsHeader��5!   (   $��Converted Items��6@   $��13(�6W   $��SemiBold"�6e   ���#EFEFF0$
 Left=�6�   $
��Left=�6�   $	��Top=�6�   $��10, 10, 0, 0q�6�   �� 5"      -
   5        $ SwapLogsDescription��5"   (   $:��4Items Swapped: {0}, Ucas Files: {1}, Utoc Files: {2}��6E   $��10(�6�   $��SemiBold"�6�   ���#454B56$
 Left=�6�   $
��Left=�6�   $	��Top=�6�   $��10, 32, 0, 0q�6  �� 5#      -   5        $
 Show��5#   %   $
��Show��63   $��769,14,19,14q�6B   6X   �� 5$      -   5        $ Reset��5$   %   $��Reset��64   $��603,14,185,14q�6D   6[   �� 5%      -   5        $ RevertAllCosmetics��5%   %   $��Revert All Cosmetics��6A   $��434,14,354,14q�6`   6w   5&      5'      �� 5(      #��[  6   ._�5)      � .+�5*      �� -   5        $ ShortCutsHeader��5*   (   $��	Shortcuts��6A   $��13(�6R   $��SemiBold"�6`   ���#EFEFF0$
 Left=�6�   $
��Left=�6�   $	��Top=�6�   $��10, 10, 0, 0q�6�   �� 5+      -   5        $ ShortCutsDescription��5+   (   $.��(Launch or close Fortnite. (Not requried)��6F   $��10(�6v   $��SemiBold"�6�   ���#454B56$
 Left=�6�   $
��Left=�6�   $	��Top=�6�   $��10, 32, 0, 0q�6�   �� 5,      -   5        $ StartFortnite��5,   %   $��Start Fortnite��6<   $��769,14,19,14q�6U   6k   �� 5-      -   5        $ CloseFortnite��5-   %   $��Close Fortnite��6<   $��603,14,185,14q�6U   6l   5.      5/      �� 50      #��[  6   ._�51      � .+�52      �� -   5        $ RefreshCosmeticsHeader��52   (   $��Refresh Cosmetics��6H   $��13(�6a   $��SemiBold"�6o   ���#EFEFF0$
 Left=�6�   $
��Left=�6�   $	��Top=�6�   $��10, 10, 0, 0q�6�   �� 53      -   5        $! RefreshCosmeticsDescription��53   (   $(��"Redownloads the api for cosmetics.��6M   $��10(�6w   $��SemiBold"�6�   ���#454B56$
 Left=�6�   $
��Left=�6�   $	��Top=�6�   $��10, 32, 0, 0q�6�   �� 54      -   5        $ RefreshCosmetics��54   %   $��Refresh��6?   $��769,14,19,14q�6Q   6g   55      56      �� 57      #��[  6   ._�58      � .+�59      �� -   5        $ LanguageHeader��59   (   $��Language��6@   $��13(�6P   $��SemiBold"�6^   ���#EFEFF0$
 Left=�6�   $
��Left=�6�   $	��Top=�6�   $��10, 10, 0, 0q�6�   �� 5:      -   5        $ LanguageDescription��5:   (   $:��4Choose your preferred language for better usability.��6E   $��10(�6�   $��SemiBold"�6�   ���#454B56$
 Left=�6�   $
��Left=�6�   $	��Top=�6�   $��10, 32, 0, 0q�6  �� 5;      -   5        $ LanguageSelection��5;   %   $��Select��6@   $��769,14,19,14q�6Q   6g   5<      5=      �� 5>      #��[  6   ._�5?      � .+�5@      �� -   5        $ DiscordRichPresenceHeader��5@   (   $��Discord Rich Presence��6K   $��13(�6h   $��SemiBold"�6v   ���#EFEFF0$
 Left=�6�   $
��Left=�6�   $	��Top=�6�   $��10, 10, 0, 0q�6�   �� 5A      -   5        $$ DiscordRichPresenceDescription��5A   (   $4��.Display Galaxy Swapper v2 activity to Discord.��6P   $��10(�6�   $��SemiBold"�6�   ���#454B56$
 Left=�6�   $
��Left=�6�   $	��Top=�6�   $��10, 32, 0, 0q�6  d� 5B      -   5         d�Name$ DiscordRichPresence��5B   +   ���#454B56���#EFEFF0$��40��6s   $��40��6   $��879,14,19,14q�6�   6�   5C      5D      �� 5E      #��[  6   ._�5F      � .+�5G      �� -   5        $ AutoCloseFortniteHeader��5G   (   $��Auto Close Fortnite��6I   $��13(�6d   $��SemiBold"�6r   ���#EFEFF0$
 Left=�6�   $
��Left=�6�   $	��Top=�6�   $��10, 10, 0, 0q�6�   �� 5H      -   5        $" AutoCloseFortniteDescription��5H   (   $>��8Automatically close Fortnite before you swap a cosmetic.��6N   $��10(�6�   $��SemiBold"�6�   ���#454B56$
 Left=�6�   $
��Left=�6�   $	��Top=�6�   $��10, 32, 0, 0q�6  d� 5I      -   5        $ AutoCloseFortnite��5I   +   ���#454B56���#EFEFF0$��40��6q   $��40��6}   $��879,14,19,14q�6�   6�   5J      5K      �� 5L      #��[  6   ._�5M      � .+�5N      �� -   5        $ KickWarningHeader��5N   (   $��Kick Warning��6C   $��13(�6W   $��SemiBold"�6e   ���#EFEFF0$
 Left=�6�   $
��Left=�6�   $	��Top=�6�   $��10, 10, 0, 0q�6�   �� 5O      -   5        $ KickWarningDescription��5O   (   $j��dDisplays a warning if you reached the max amount of assets. (Not recommended to disable if your new)��6H   $��10(�6�   $��SemiBold"�6�   ���#454B56$
 Left=�6�   $
��Left=�6  $	��Top=�6  $��10, 32, 0, 0q�65  d� 5P      -    5        $ KickWarning��5P   +   ���#454B56���#EFEFF0$��40��6k   $��40��6w   $��879,14,19,14q�6�   6�   5Q      5R      �� 5S      #��[  6   ._�5T      � .+�5U      �� -!   5        $ BackPackGenderHeader��5U   (   $��Skin Gender Check��6F   $��13(�6_   $��SemiBold"�6m   ���#EFEFF0$
 Left=�6�   $
��Left=�6�   $	��Top=�6�   $��10, 10, 0, 0q�6�   �� 5V      -"   5        $ BackPackGenderDescription��5V   (   $����Match skin option genders (When disabled you will be able to swap female to male and male to female but they will apear default in lobby)��6K   $��10(�6�   $��SemiBold"�6�   ���#454B56$
 Left=�6  $
��Left=�6*  $	��Top=�6E  $��10, 32, 0, 0q�6]  d� 5W      -#   5        $ BackPackGender��5W   +   ���#454B56���#EFEFF0$��40��6n   $��40��6z   $��879,14,19,14q�6�   6�   5X      5Y      �� 5Z      #��[  6   ._�5[      � .+�5\      �� -$   5        $ 
NsfwHeader��5\   (   $��Skin Gender Check��6<   $��13(�6U   $��SemiBold"�6c   ���#EFEFF0$
 Left=�6�   $
��Left=�6�   $	��Top=�6�   $��10, 10, 0, 0q�6�   �� 5]      -%   5        $ NsfwDescription��5]   (   $����Match skin option genders (When disabled you will be able to swap female to male and male to female but they will apear default in lobby)��6A   $��10(�6�   $��SemiBold"�6�   ���#454B56$
 Left=�6  $
��Left=�6   $	��Top=�6;  $��10, 32, 0, 0q�6S  d� 5^      -&   5        $
 Nsfw��5^   +   ���#454B56���#EFEFF0$��40��6d   $��40��6p   $��879,14,19,14q�6{   6�   5_      5`      5a      5b      5c      5d      5e      