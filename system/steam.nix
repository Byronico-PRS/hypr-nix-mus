{ config, pkgs, ... }: {
 #STEAM
   programs.steam = {
     enable = true;
     remotePlay.openFirewall = true;
     dedicatedServer.openFirewall = true;
     extraCompatPackages = [ pkgs.proton-ge-bin ];
     };

 #GAMEMODE — melhora performance em jogos
   programs.gamemode.enable = true;

 #LUTRIS
   environment.systemPackages = with pkgs; [
      (lutris.override {
        extraLibraries = pkgs: [
          wineWow64Packages.full
        ];
      })
    ];

 #OPENGL
   hardware.graphics.enable = true;
   hardware.graphics.enable32Bit = true;

}


