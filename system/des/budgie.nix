{ config, pkgs, ... }: {


  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable budgie

services.xserver.desktopManager.budgie.enable = true;
services.xserver.displayManager.lightdm.enable = true;
}