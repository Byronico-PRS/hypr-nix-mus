{ config, pkgs, callPackage, ... }:

{

 home.file.".config/hypr/hyprpaper.conf".text = ''
    # Hyprpaper Configuration
   
    # Diretório onde o papel de parede está localizado
 
    # Papel de parede padrão para todas as saídas
    preload = ~/.dotfiles/backgrounds/space.jpg
    wallpaper = eDP-1,~/.dotfiles/backgrounds/space.jpg
    wallpaper = HDMI-A-1,~/.dotfiles/backgrounds/space.jpg
    splash = true
  '';

}