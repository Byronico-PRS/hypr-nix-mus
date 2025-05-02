{ config, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      desktopManager = {
        xfce = {
          enable = true;
          noDesktop = true;  # Prevent Xfce from managing the desktop
          enableXfwm = false;  # Disable Xfce's window manager
        };
      };
      windowManager.awesome = {
        enable = true;
        luaModules = with pkgs.luaPackages; [
          luarocks  # Package manager for Lua modules
          luadbi-mysql  # Database abstraction layer
        ];
      };
    };
    displayManager = {
      sddm.enable = true;
      defaultSession = "xfce+awesome";
    };
  };
}