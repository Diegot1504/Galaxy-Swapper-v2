   M S B A M L   `   `   `  ����L  HGalaxy Swapper v2, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullU/clr-namespace:Galaxy_Swapper_v2.Workspace.Views!Galaxy_Swapper_v2.Workspace.Views  5   	   _4clr-namespace:Galaxy_Swapper_v2.Workspace.Components&Galaxy_Swapper_v2.Workspace.Components  5   	   0    *Galaxy_Swapper_v2.Workspace.Views.MainView   5   	   W SPresentationCore, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=7.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5   	   R NSystem.Xaml, Version=7.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Alocal/clr-namespace:Galaxy_Swapper_v2.Workspace.Views     5   	   K
components4clr-namespace:Galaxy_Swapper_v2.Workspace.Components     5   	   -   5          � Title$  MainView��5	   	   $	��648��5
   	   $
��1048��5   	   $	��648��5   	   $
��1048��5   	    � WindowStyle$
 None=�5   	    � WindowStartupLocation$ CenterScreen=�5   	   
������  � AllowsTransparency$
 True��5   	   .��5      � -   5        $
��Base��5      .+�5   
   �� -   5         ��Name$
 Main��5      ���#090B0E �� CornerRadius$ 10��64   ._�5      � .+�5      �� -   5        $ 	TabHolder��5      $��	63,48,0,0q�6,   �� 5      ���#060709$ 	10,0,0,10��6.   $
��Left=�6G   $��60��6b    J� Effect 5      3  -System.Windows.Media.Effects.DropShadowEffect  5         ShadowDepth$ 3Q�6+      Opacity$	 0.2Q�6;   ._�5      �� $��Center=�6!   $��Center=�6<   .+�5      8   2Galaxy_Swapper_v2.Workspace.Components.CTabControl  -   5        	  Name$	 	Dashboard��5   1   8   2Galaxy_Swapper_v2.Workspace.Components.CTabControl
   MouseLeftButtonDown$
 	Tab_Click��6�      Presence$ 	Dashboard��6D      Icon$% /Workspace/Assets/Dashboard.png��6Y      IconClicked$- '/Workspace/Assets/Dashboard_Clicked.png��6�   6�     5      -   5        $	 
Characters��5   1   $
 	Tab_Click��6�   $ Skins��6E   $&  /Workspace/Assets/Characters.png��6V   $. (/Workspace/Assets/Characters_Clicked.png��6~   6�     5      -   5        $	 	Backpacks��5   1   $
 	Tab_Click��6�   $ 
BackBlings��6D   $% /Workspace/Assets/Backpacks.png��6Z   $- '/Workspace/Assets/Backpacks_Clicked.png��6�   6�     5       -   5        $	 Pickaxes��5    1   $
 	Tab_Click��6�   $ Pickaxes��6C   $$ /Workspace/Assets/Pickaxes.png��6W   $, &/Workspace/Assets/Pickaxes_Clicked.png��6}   6�     5!      -	   5        $	 Dances��5!   1   $
 	Tab_Click��6�   $ Emotes��6A   $" /Workspace/Assets/Dances.png��6S   $* $/Workspace/Assets/Dances_Clicked.png��6w   6�     5"      -
   5        $	 Gliders��5"   1   $
 	Tab_Click��6�   $ Gliders��6B   $# /Workspace/Assets/Gliders.png��6U   $+ %/Workspace/Assets/Gliders_Clicked.png��6z   6�     5#      -   5        $	 Weapons��5#   1   $
 	Tab_Click��6�   $ Weapons��6B   $# /Workspace/Assets/Weapons.png��6U   $+ %/Workspace/Assets/Weapons_Clicked.png��6z   6�     5$      -   5        $
	 Misc��5$   1   $
 	Tab_Click��6�   $
 Misc��6?   $  /Workspace/Assets/Misc.png��6O   $( "/Workspace/Assets/Misc_Clicked.png��6q   6�     5%      -   5        $	 Plugins��5%   1   $
 	Tab_Click��6�   $ Plugins��6B   $# /Workspace/Assets/Plugins.png��6U   $+ %/Workspace/Assets/Plugins_Clicked.png��6z   6�     5&      -   5        $	 Settings��5&   1   $
 	Tab_Click��6�   $ Settings��6C   $$ /Workspace/Assets/Settings.png��6W   $, &/Workspace/Assets/Settings_Clicked.png��6}   6�   5'      5(      :   4Galaxy_Swapper_v2.Workspace.Components.CCloseControl  5)      -   5          Name$ CloseButton��5)   +   :   4Galaxy_Swapper_v2.Workspace.Components.CCloseControl   MouseLeftButtonDown$ Close_Click��6�   $��Right=�6@   $	��Top=�6\   $��5,5,5,5q�6t   6�   =   7Galaxy_Swapper_v2.Workspace.Components.CMinimizeControl  5*      -   5          Name$ MinimizeButton��5*   .   =   7Galaxy_Swapper_v2.Workspace.Components.CMinimizeControl   MouseLeftButtonDown$ Minimize_Click��6�   $��Right=�6F   $	��Top=�6b   $��5,5,45,5q�6z   6�   >   8Galaxy_Swapper_v2.Workspace.Components.CSearchbarControl  5+      -   5          Name$ 	SearchBar��5+   /   $��Right=�6B   $	��Top=�6^   $��5,5,90,5q�6v   $y�Hidden=�6�   �� 5,      -   5        $
 Drag��5,      $��60,0,360,601q�6'   
������ 6V   5-      5.      5/      50      