 { config, pkgs, callPackage, ... }: {
      home.file.".config/xfce4/helpers.rc".text = ''
      #colocar kitty como terminal emulator para os programsa do xfce
        TerminalEmulator=kitty
        TerminalEmulatorDismissed=true

  '';

}