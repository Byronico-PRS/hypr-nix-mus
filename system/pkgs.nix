{ config, pkgs, ... }: 

let
  apply-user = import ./scripts/apply-user.nix { inherit pkgs; };
  apply-system = import ./scripts/apply-system.nix { inherit pkgs; };
  calendar = import ./scripts/calendar.nix { inherit pkgs; };
  reaper-ll = import ./scripts/reaper-ll.nix { inherit pkgs; };
 
in
{

  programs.kdeconnect.enable = true;
 environment.systemPackages = with pkgs; [
  # scripts de usuario
    apply-user
    apply-system
    calendar
    reaper-ll #lowlatency reaper start for pipewire
    
  # system 
    # lightdm_gtk_greeter    
    gparted
    libsForQt5.breeze-icons
    zafiro-icons
    xarchiver
  
 
  # terminal apps
    fastfetch
    wget
    xz
    gzip
    vim
    htop
    btop
    unzip
    p7zip
    maia-icon-theme
    gparted
    libsForQt5.breeze-icons
    zafiro-icons
    libsForQt5.kdeconnect-kde  
    kdePackages.kdeconnect-kde  
    cmatrix
    # libsForQt5.bismuth
    fluidsynth
    zita-alsa-pcmi
    jack-example-tools
    alsa-tools
    jack2
    soundfont-fluid
    soundfont-ydp-grand
    wf-recorder
  
  # Internet
    firefox #browser
    brave #browser
    thunderbird #mail-client
    vivaldi
    
  # Escritorio
    
    emacs-gtk
    notes
    libreoffice #office suite
    okular #pdf reade #versao flatpak parece funcionar melhor no awesomewm
    vscodium #text editor
    direnv
    git
    unetbootin #live usb creator
    nextcloud-client #cloud files
    dropbox-cli
    dropbox
    maestral-gui
    xfce.thunar-dropbox-plugin
    zenity
    usbutils
  
  # Audio
    
    musescore #editor de partitura
    reaper #daw essa versao provoca dificuldades de configuração com o reapck e outros plugins do js
    ardour #daw
    milkytracker #tracker
      qjackctl
  # Video
    obs-studio #rec_screen vide_studio
    vlc #video player
    libsForQt5.kdenlive #video editor
    gphoto2 #cam tool
       
    #Windows apps
    linvstmanager
    wineWowPackages.full
    wineWowPackages.fonts
    wine
    wineasio
    winetricks
    winePackages.fonts
    carla
    yabridge
    yabridgectl
    ffmpeg-full
  # Impressora
    gnomeExtensions.alternate-menu-for-hplip2
    hplipWithPlugin
  # imagens
    gimp
    inkscape 
  #games
    scid         
  ];
}
