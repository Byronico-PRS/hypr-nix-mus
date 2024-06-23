{ config, pkgs, ... }:
let
  apply-user = import ./scripts/apply-user.nix { inherit pkgs; };
  apply-system = import ./scripts/apply-system.nix { inherit pkgs; };
  calendar = import ./scripts/calendar.nix { inherit pkgs; };
  reaper-ll = import ./scripts/reaper-ll.nix { inherit pkgs; };
 
in
 {
    #file manager
programs.thunar.enable = true;
programs.xfconf.enable = true;
programs.thunar.plugins = with pkgs.xfce; [
  thunar-archive-plugin
  thunar-volman
];
services.gvfs.enable = true; # Mount, trash, and other functionalities
services.tumbler.enable = true; # Thumbnail support for images

  environment.systemPackages = with pkgs; [
   #scripts de usuario
    apply-user
    apply-system
    calendar
    reaper-ll #lowlatency reaper start for pipewire
   #Libs for sddm theme
    # libsForQt5.qtstyleplugin-kvantum 
     #kdePackages.sddm-kcm
     #kdePackages.sddm
     libsForQt5.qt5.qtquickcontrols2
     libsForQt5.qt5.qtgraphicaleffects 
     where-is-my-sddm-theme
     sddm-chili-theme
     catppuccin-sddm
     catppuccin-sddm-corners
     elegant-sddm
     libsForQt5.sddm-kcm
   #desktop 
     xwaylandvideobridge
     bottles
     kdePackages.qtstyleplugin-kvantum
     libsForQt5.oxygen-icons
     libsForQt5.breeze-icons
     libsForQt5.qt5.qtwayland
     libsForQt5.qtstyleplugin-kvantum
     xdg-desktop-portal-hyprland   
     wayland-protocols
     wayland-utils
     wlroots
     xdg-desktop-portal-gtk
     xdg-utils
     xwayland
     nwg-look
     zuki-themes
   #terminal
      kitty
   #network bluetooth applet
     overskride
     blueberry
     gnome-icon-theme
     networkmanagerapplet
   #hyprprograms
     hyprpaper
     hyprlock
     hyprlang
     hypridle
     hyprpicker
     udiskie
   #audio
     pavucontrol
     spotify
   #Clipboard
     yad
     copyq
     clipman
     wl-clipboard
     wl-clip-persist
     cliphist
     vimiv-qt
   #notfy applet
      dunst
      libnotify
    # comunication
      zapzap
      webcord
   #menu  
      rofi-wayland
   #monitor  
     arandr
   #video codec
  
    ffmpeg_6-full
   #media player  
    playerctl
    mpv
   #screenshot 
    gphoto2
    grim
    swappy
    slurp
   #panel  
    (pkgs.waybar.overrideAttrs (oldAttrs: {
    mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    })
    )
    
  ];


}