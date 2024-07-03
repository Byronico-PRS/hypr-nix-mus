{config, pkgs, inputs, ...}: 

{ 

  imports = [
     #pgks
       ./pkgsland.nix

   ];
  security.polkit.enable = true;
  #Display manager .. cant config sddm so i quit  
   # services.displayManager.sddm.wayland = {
   #   
   #   enable = true;
   #   };
   # services.displayManager.sddm = {
   #   enable = true;
   #   theme = "elegant-sddm";
   #   };  
    
  programs = {
    hyprlock.enable = true; 
        hyprland = { 
      enable = true;
      xwayland.enable = true;
     # package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      systemd.setPath.enable = true;
     };

   };
 
 services.hypridle.enable = true;

 # Fonts
   fonts.packages = with pkgs; [
     # Nerd fonts
     nerdfonts
     meslo-lgs-nf
    ];

   xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-hyprland
    ];

   };
# qt = {
#  enable = true;
#   platformTheme = "qt5ct";
#   style = "kvantum";
#   };

 xdg.icons.enable = true;
    # Optional, hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  
 services.blueman.enable = true;
 hardware.bluetooth.enable = true;
 hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
 #hardware.bluetooth.settings = {
   # General = {
  #    Enable = "Source,Sink,Media,Socket";
  #  };
 # };
 
 }
