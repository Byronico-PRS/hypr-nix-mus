{ config, pkgs, ... }: {
  

  # Make some extra kernel modules available to NixOS (configuracao para camera DSRL, importante q tenho ffmpg já instalado)
  boot.extraModulePackages = with config.boot.kernelPackages;
   [ v4l2loopback.out ];

  # Activate kernel modules (choose from built-ins and extra ones)
  boot.kernelModules = [
    # Virtual Camera
    "v4l2loopback"
  ];

  # Set initial kernel module settings
  boot.extraModprobeConfig = ''
    # exclusive_caps: Skype, Zoom, Teams etc. will only show device when actually streaming
    # card_label: Name of virtual camera, how it'll show up in Skype, Zoom, Teams
    # https://github.com/umlaeute/v4l2loopback
    options v4l2loopback exclusive_caps=1 max_buffers=2 card_label="Canon"
  '';

}