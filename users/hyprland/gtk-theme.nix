 {config, pkgs, lib, ... }: {
 
 gtk = {
      enable = true;
      font.name = "TeX Gyre Adventor 10";
      theme = {
         name = "Juno";
         package = pkgs.juno-theme;
        };
      iconTheme = {
         name = "Papirus-Dark";
         package = pkgs.papirus-icon-theme;
       };

      #gtk3.extraConfig = {
      #   Settings = ''
       #  gtk-application-prefer-dark-theme=1
      # '';
      # };

      #gtk4.extraConfig = {
      #   Settings = ''
      #   gtk-application-prefer-dark-theme=1
       # '';
       # };
 };

  qt = {
  enable = true;
  platformTheme.name = "qt5ct";
  style.name = "kvantum";
};
}