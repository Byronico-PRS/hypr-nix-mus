{ config, pkgs, ... }:
let
  apply-user = import ./scripts/apply-user.nix { inherit pkgs; };
  apply-system = import ./scripts/apply-system.nix { inherit pkgs; };
  calendar = import ./scripts/calendar.nix { inherit pkgs; };
  reaper-ll = import ./scripts/reaper-ll.nix { inherit pkgs; };
 
in
 {

  environment.systemPackages = with pkgs; [
   #scripts de usuario
    apply-user
    apply-system
    calendar
    reaper-ll #lowlatency reaper start for pipewire
   #Libs for sddm theme
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
   #file manager
      cinnamon.nemo-with-extensions
      cinnamon.nemo
      cinnamon.nemo-emblems
      cinnamon.nemo-fileroller   
      cinnamon.folder-color-switcher
      cinnamon.nemo-python
      nemo-qml-plugin-dbus

   #menu  
      rofi-wayland
   #monitor  
     arandr
   #video codec
  
    ffmpeg_6-full
   #media player  
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