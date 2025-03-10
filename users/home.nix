{ config, pkgs, callPackage, ... }:

{
  imports = [
    #My hyprland config 1
    #./hyprland/default.nix
    # My XFCE config
     ./xfce/xfconf.nix    
  ];
   
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "emmp";
  home.homeDirectory = "/home/emmp";
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

 nixpkgs.config.allowUnfree = true;

#  xsession.enable = true;

  # Hyprland without a flake
#{
 # programs.hyprland.xwayland.enable = true;
#}
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    git
    git-crypt
    gnupg
    pinentry-qt
    hyprcursor
    bluez-alsa
    bluez-tools
    libsForQt5.bluez-qt
    #audio plugins 
      
      infamousPlugins
      zam-plugins
      ladspaPlugins
      tap-plugins
      lsp-plugins
      surge-XT
      x42-plugins
      magnetophonDSP.pluginUtils 
      sfizz
      helm #synth
      distrho-ports #pugin suite
      drumgizmo #drum sample
      vmpk    #piano
      guitarix # guitar amps
      gxplugins-lv2 #guitar plugin
      calf #plugin suite
      tonelib-metal
      lv2
      caps
      eq10q
    
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
#enable gpg

 programs.gpg = {
  enable = true;
};
# services.gpg-agent = {
#   enable = true;
#   pinentryFlavor = "qt";
#};

# Enabling git
   programs.git = {
     enable = true;
     userName  = "byronico";
     userEmail = "pauloserafim1710@gmail.com";
     extraConfig = {
         init.defaultBranch = "main";
  };



  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = { 
   
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # my git mail is:
  # 68123023+Byronico-PRS@users.noreply.github.com
  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/emmp/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

