{ config, pkgs, callPackage, ... }:

{
  imports = [
   
    #My Hyprland config
     ./hyprconf.nix
    #My hypridle config
     ./hypridleconf.nix
    #My hypridle config
     ./hyprlockconf.nix
    #My panel
     ./waybar.nix
    #dunst-conf nixdots configs
     ./dunstconf.nix
    #Wallpaper
     ./hyprpaperconf.nix
    #gtk-theme-qt-theme
     ./gtk-theme.nix
    #kitty-conf
     ./kittyconf.nix
   ];
   
}

