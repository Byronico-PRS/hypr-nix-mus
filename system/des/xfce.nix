  { config, pkgs, ... }: {
  
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  
   # Enable the XFCE Desktop Environment.
 services.xserver.displayManager.lightdm = {
   enable = true;
   background = "/home/emmp/Imagens/punch_bgs/saitama_paint.jpg";
   greeters.gtk = {
     enable = true;
     #iconTheme.package = pkgs.maia-icon-theme;
     #iconTheme.name = "Maia-dark"; 
     theme.package = pkgs.zuki-themes;
     theme.name = "Zukitwo-dark";
     extraConfig = "user-background = false";
   };
 };

  services.xserver.desktopManager = { 
    xfce.enable = true;
    wallpaper.mode = "scale";
  };

  # Enable xconf.settings in home-manager, to set the xfce desktop
   programs.xfconf.enable = true;
   
    environment.systemPackages = with pkgs; [
  xarchiver
  unzip
  zip
  unrar
  p7zip
# Xfce Apps
  pavucontrol
  xfce4-pulseaudio-plugin
  catfish
  xfce4-whiskermenu-plugin
  xfce4-clipman-plugin
  thunar-archive-plugin
  xfce4-genmon-plugin
  ];
  }