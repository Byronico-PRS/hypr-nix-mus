# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =[
   # # Essentials:
   
     # Include the results of the hardware scan. (Copy your file from /etc/nixos)
     ./hardware-configuration.nix
     
     # List of my Packages (choose your environment apps)
      ./pkgs.nix
      #musnix channel
      <musnix>
     # My config audio file (audio config for pulse audio with jack)     
        # with pulse
        #./audio.nix
        #with pipewire
        ./audio-pipewire.nix 
    
     # Steam and game configs
      ./steam.nix 
     
     # My nvidia graphics config (nao estao funcionando em meu pc) 
      ./nvidia-dell.nix # is not working
           
     #Configs for cannon as online cam
      ./video.nix

     # Choose your DE or WM
        # Plasma KDE
         # ./des/kde.nix
        
        # GNOME DE (pipewire conflito)
         # ./des/gnome.nix
        
        # XFCE DE
         # ./des/xfce.nix
       
        # Budgie DE 
         # ./des/budgie.nix 
            
        # Awesome WM
        # ./wms/awesomewm/awesome.nix 
        
        # Hyprland WM 
          ./wms/hyprlandwm/hyprland.nix 
          
   ];

  
  # Enabling Musnix
   musnix.enable = true;
   #musnix.soundcardPciId = "00:05.0";
   #musnix.kernel.realtime = true;
   musnix.rtirq.enable = true;
   musnix.rtcqs.enable = true;
   musnix.alsaSeq.enable = true;

  # Bootloader.
   boot.loader.grub.enable = true;
   boot.loader.grub.device = "/dev/sda";
   boot.loader.grub.useOSProber = true;

  networking.hostName = "paulo_dell"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary 
   # networking.proxy.default = "http://user:password@proxy:port/";
   # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
   networking.networkmanager.enable = true;
  
  # Enable Flakes
   nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Enable flatpak
   xdg.portal.enable = true;
   services.flatpak.enable = true;
   xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Set your time zone.
   time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
   i18n.defaultLocale = "pt_BR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };


  # Configure keymap in X11
   services.xserver.xkb = {
     layout = "br";
     variant = "";
    };

  # Configure console keymap
   console.keyMap = "br-abnt2";

  # Enable CUPS to print documents.
   services.printing = {
     enable = true;
     defaultShared = true;
     browsing = true;
   };
  
  # Enable browse print
   services.avahi = {
     enable = true;
     nssmdns4 = true;
   };
  programs.system-config-printer.enable = true;

  # Enable ntfs file system (to open pen drives in ntfs)
   boot.supportedFilesystems = [ "ntfs" ];
 
  # Enable touchpad support (enabled default in most desktopManager).
   services.libinput.enable = true;

 # Define a user account. Don't forget to set a password with ‘passwd’. 
   users.users.emmp = {
     isNormalUser = true;
     description = "emmp";
     homeMode = "755";
     extraGroups = [ "networkmanager" "wheel" "audio" "jackaudio" ];
     packages = with pkgs; [
      #games
      scid #chessdatabase
      ltris #tetris
      abuse #sidescroller action game
      xonotic #multiplayer fps
      stockfish #chess engine   
     ]; 
  };
  
 # Enable auto upgrade nixos
   #system.autoUpgrade.enable = true;
   #system.autoUpgrade.allowReboot = true;
  
 # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
 

 # Some programs need SUID wrappers, can be configured further or are
 # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

 # List services that you want to enable:
 
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  # Enable KDE Connect adn Dropbox
   networking.firewall = { 
    enable = true;
    allowedTCPPortRanges = [ 
      { from = 1714; to = 1764; } # KDE Connect
    ];  
    allowedUDPPortRanges = [ 
      { from = 1714; to = 1764; } # KDE Connect
    ];  
    allowedTCPPorts = [ 17500 ]; # Dropbox
    allowedUDPPorts = [ 17500 ]; # Dropbox
    };
   #Just dropbox
    systemd.user.services.dropbox = {
    description = "Dropbox";
    wantedBy = [ "graphical-session.target" ];
    environment = {
      QT_PLUGIN_PATH = "/run/current-system/sw/" + pkgs.qt5.qtbase.qtPluginPrefix;
      QML2_IMPORT_PATH = "/run/current-system/sw/" + pkgs.qt5.qtbase.qtQmlPrefix;
    };

  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
