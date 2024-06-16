 { config, pkgs, callPackage, ... }: {
      home.file.".config/kitty/kitty.conf".text = ''
      #Nao perguntar se quero fechar, para perguntar -1
        confirm_os_window_close 0

  '';

}