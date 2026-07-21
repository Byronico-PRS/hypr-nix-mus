{ config, pkgs, lib, ... }:

{
  imports = [
    ./xfce/xfconf.nix
  ];

  home.username = "emmp";
  home.homeDirectory = "/home/emmp";
  home.stateVersion = "23.05";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # ferramentas
    git
    git-crypt
    gnupg
    pinentry-qt
    bluez-alsa
    bluez-tools

    # plugins instalados no perfil (também disponíveis como apps standalone)
    lsp-plugins
    surge-xt
    calf
    drumgizmo
    neural-amp-modeler-lv2
    sonobus
    zam-plugins
    distrho-ports
    infamousPlugins
    eq10q
    x42-plugins
    helm
    tap-plugins
    ladspaPlugins
    caps
    tonelib-metal
    sfizz
    guitarix
    gxplugins-lv2
    magnetophonDSP.pluginUtils
    lv2
    vmpk
  ];

  # Copia arquivos reais para ~/.lv2, ~/.vst3, ~/.clap, ~/.vst, ~/.ladspa
  # Necessário porque o Reaper Flatpak não segue symlinks para /nix/store
  home.activation.copyAudioPlugins = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "$HOME/.lv2" "$HOME/.vst3" "$HOME/.clap" "$HOME/.vst" "$HOME/.ladspa"
    chmod -R u+w "$HOME/.lv2" "$HOME/.vst3" "$HOME/.clap" "$HOME/.vst" "$HOME/.ladspa" 2>/dev/null || true

    copy_pkg() {
      local pkg="$1"
      [ -d "$pkg/lib/lv2" ]    && cp -rfL --no-preserve=mode "$pkg/lib/lv2/."    "$HOME/.lv2/"    || true
      [ -d "$pkg/lib/vst3" ]   && cp -rfL --no-preserve=mode "$pkg/lib/vst3/."   "$HOME/.vst3/"   || true
      [ -d "$pkg/lib/clap" ]   && cp -rfL --no-preserve=mode "$pkg/lib/clap/."   "$HOME/.clap/"   || true
      [ -d "$pkg/lib/vst" ]    && cp -rfL --no-preserve=mode "$pkg/lib/vst/."    "$HOME/.vst/"    || true
      [ -d "$pkg/lib/ladspa" ] && cp -rfL --no-preserve=mode "$pkg/lib/ladspa/." "$HOME/.ladspa/" || true
      [ -d "$pkg/lib/lxvst" ]  && cp -rfL --no-preserve=mode "$pkg/lib/lxvst/."  "$HOME/.vst/"    || true
    }

    copy_pkg ${pkgs.lsp-plugins}
    copy_pkg ${pkgs.surge-xt}
    copy_pkg ${pkgs.calf}
    copy_pkg ${pkgs.drumgizmo}
    copy_pkg ${pkgs.neural-amp-modeler-lv2}
    copy_pkg ${pkgs.sonobus}
    copy_pkg ${pkgs.zam-plugins}
    copy_pkg ${pkgs.distrho-ports}
    copy_pkg ${pkgs.infamousPlugins}
    copy_pkg ${pkgs.eq10q}
    copy_pkg ${pkgs.x42-plugins}
    copy_pkg ${pkgs.helm}
    copy_pkg ${pkgs.tap-plugins}
    copy_pkg ${pkgs.ladspaPlugins}
    copy_pkg ${pkgs.caps}
    copy_pkg ${pkgs.tonelib-metal}
    copy_pkg ${pkgs.sfizz}
    copy_pkg ${pkgs.guitarix}
    copy_pkg ${pkgs.gxplugins-lv2}
    copy_pkg ${pkgs.magnetophonDSP.pluginUtils}
  '';

  programs.gpg.enable = true;

  programs.git = {
    enable = true;
    settings.user.name  = "byronico";
    settings.user.email = "pauloserafim1710@gmail.com";
    settings.init.defaultBranch = "main";
  };

  programs.home-manager.enable = true;
}
