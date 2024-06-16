  { config, pkgs, ... }: {
  
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  
   # Enable the XFCE Desktop Environment.
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

  services.xserver.desktopManager = { 
    xfce.enable = true;
    wallpaper.mode = "scale";
  };

  # Enable xconf.settings in home-manager, to set the xfce desktop
   programs.xfconf.enable = true;
   
    environment.systemPackages = with pkgs; [
  
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