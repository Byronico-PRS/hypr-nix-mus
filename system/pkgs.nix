{ config, pkgs, ... }: 
{

  programs.kdeconnect.enable = true;
 environment.systemPackages = with pkgs; [

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
    ffmpeg
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
    alsaTools
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
    gnome.zenity
    usbutils
  
  # Audio
    lsp-plugins
    surge-XT
    x42-plugins
    magnetophonDSP.pluginUtils 
    sfizz
    musescore #editor de partitura
    reaper #daw essa versao provoca dificuldades de configuração com o reapck e outros plugins do js
    ardour #daw
    milkytracker #tracker
    helm #synth
    distrho #pugin suite
    drumgizmo #drum sample
    vmpk    #piano
    guitarix # guitar amps
    gxplugins-lv2 #guitar plugin
    calf #plugin suite
    tonelib-metal #guitaramp
  # Video
    obs-studio #rec_screen vide_studio
    vlc #video player
    libsForQt5.kdenlive #video editor
    gphoto2 #cam tool
       
    #Windows apps
    wineWowPackages.waylandFull
    wine
    wineasio
    winetricks
    winePackages.fonts
    carla
    yabridge
    yabridgectl
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