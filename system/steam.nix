{ config, pkgs, ... }: {
 #STEAM
   programs.steam = {
     enable = true;
     remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
     dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
     };
 #LUTRIS 
   environment.systemPackages = with pkgs; [
      (lutris.override {
        extraLibraries =  pkgs: [
          # List library dependencies here
        ];
      })
    ];
 #OPENGL
   hardware.opengl.driSupport32Bit = true;
 #ICONS4LUTRIS
 #  environment.systemPackages = [ gnome.adwaita-icon-theme ];

}


