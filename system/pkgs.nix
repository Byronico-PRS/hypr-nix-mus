{ config, pkgs, ... }: 

let
  apply-user    = import ./scripts/apply-user.nix    { inherit pkgs; };
  apply-system  = import ./scripts/apply-system.nix  { inherit pkgs; };
  calendar      = import ./scripts/calendar.nix      { inherit pkgs; };
  reaper-ll     = import ./scripts/reaper-ll.nix     { inherit pkgs; };
  audio-gravacao = import ./scripts/audio-gravacao.nix { inherit pkgs; };
  audio-normal   = import ./scripts/audio-normal.nix  { inherit pkgs; };

in
{

  programs.kdeconnect.enable = true;
 environment.systemPackages = with pkgs; [
  # scripts de usuario
    apply-user
    apply-system
    calendar
    reaper-ll       # lowlatency reaper start for pipewire
    audio-gravacao  # quantum 256 (~5.3ms) para gravação
    audio-normal    # quantum 1024 (~21ms) para uso normal

  # system
    gparted
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
    kdePackages.breeze-icons
    claude-code
    kdePackages.kdeconnect-kde
    cmatrix
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
    #thunderbird #mail-client
    #vivaldi
    
  # Escritorio
    
    emacs-gtk
    notes
    libreoffice #office suite
    kdePackages.okular #pdf reade #versao flatpak parece funcionar melhor no awesomewm
    vscodium #text editor
    direnv
    git
    unetbootin #live usb creator
    nextcloud-client #cloud files
    dropbox-cli
    dropbox
    maestral-gui
    thunar-dropbox-plugin
    zenity
    usbutils
    varia #download manager
  
  # Audio
    
    musescore #editor de partitura
    reaper #daw essa versao provoca dificuldades de configuração com o reapck e outros plugins do js
    ardour #daw
    milkytracker #tracker
      qjackctl
  # Video
    obs-studio #rec_screen vide_studio
    vlc #video player
    kdePackages.kdenlive #video editor
    gphoto2 #cam tool
       
    #Windows apps
    linvstmanager
    wineWow64Packages.full
    wineWow64Packages.fonts
    wineasio
    winetricks
    winePackages.fonts
    carla
    wineWow64Packages.staging
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
    #scid    
  ];
}
