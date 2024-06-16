
{ config, pkgs, home, ... }:
{
# My XFCE Settings:
xfconf.settings = {          
# Background
  xfce4-desktop = {
   "backdrop/screen0/monitoreDP-1/workspace0/last-image" = "/home/emmp/.dotfiles/backgrounds/fubui.png";
   };
# Shortcuts
  xfce4-keyboard-shortcuts = {
   "commands/custom/<Super>c" = "codium";
   "commands/custom/<Super>w" = "brave";
   "commands/custom/<Super>z" = "xfce4-popup-whiskermenu";
   "xfwm4/custom/<Shift><Super>at" = "move_window_workspace_2_key";
   "xfwm4/custom/<Shift><Super>dollar" = "move_window_workspace_4_key";
   "xfwm4/custom/<Shift><Super>exclam" = "move_window_workspace_1_key";
   "xfwm4/custom/<Shift><Super>numbersign" = "move_window_workspace_3_key";
   "xfwm4/custom/<Super>1" = "workspace_1_key";
   "xfwm4/custom/<Super>2" = "workspace_2_key";
   "xfwm4/custom/<Super>3" = "workspace_3_key";
   "xfwm4/custom/<Super>4" = "workspace_4_key";
   "xfwm4/custom/<Super>d" = "move_window_to_monitor_left_key";
   "xfwm4/custom/<Super>f" = "move_window_to_monitor_right_key";
   "xfwm4/custom/<Super>q" = "close_window_key";
   "xfwm4/custom/<Primary><Shift>a" = "tile_left_key"; 
   "xfwm4/custom/<Primary><Shift>d" = "tile_right_key";
   "xfwm4/custom/<Primary><Shift>s" = "maximize_window_key";
   };
 # Panel  
# xfce4-panel = { 
#  "plugins/plugin-1" = "whiskermenu";
#  "plugins/plugin-12/digital-date-format" = "%d/%m/%Y";
#  "plugins/plugin-12/digital-layout" = "1"; 
#   };  
# # Themes  
 xsettings = { 
  "Net/ThemeName" = "Zukitre-dark";
  "Net/IconThemeName" = "maia-dark";
   }; 
 # Window Manager
 xfwm4 = {
   "general/easy_click" = "Super"; 
   "general/theme" = "Zukitre-dark";
#   "general/workspace_count" = "4";
  }; 
 };

}