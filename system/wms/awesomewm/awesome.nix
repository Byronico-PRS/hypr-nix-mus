{ config, pkgs, ... }:  {

  # Enable the X11 windowing system.
  services.xserver.enable = true;

   # Enable the lightdm.
 services.xserver.displayManager.lightdm = {
   enable = true;
   background = "/home/emmp/Imagens/punch_bgs/saitama_paint.jpg";
   greeters.gtk = {
     enable = true;
     iconTheme.package = pkgs.maia-icon-theme;
     iconTheme.name = "Maia-dark"; 
     theme.package = pkgs.zuki-themes;
     theme.name = "Zukitwo-dark";
     extraConfig = "user-background = false";
   };
 };

  services.xserver.windowManager.awesome = {
    enable = true;
    luaModules = with pkgs.luaPackages; [
      luarocks # is the package manager for Lua modules
      luadbi-mysql # Database abstraction layer
     ];
    };

  environment.systemPackages = with pkgs; [
   rofi
   picom
   i3lock-fancy
   xclip
   materia-theme
   papirus-icon-theme
   lxappearance
   xorg.xbacklight
   flameshot
   pnmixer
   networkmanagerapplet
   xfce.xfce4-power-manager
   xfce.xfce4-battery-plugin
   xfce.xfce4-terminal
   roboto
   xfce.thunar
   xfce.xfce4-taskmanager
   nitrogen
   arandr
    
# Xfce Apps
  pavucontrol #mixer audio program
  xfce.xfce4-pulseaudio-plugin #applet that fits in xfce theme that control pavucontrol
  xfce.catfish
  xfce.xfce4-whiskermenu-plugin 
  xfce.xfce4-clipman-plugin   
  xfce.thunar-archive-plugin  
  xfce.xfce4-genmon-plugin
  
   ];
}
