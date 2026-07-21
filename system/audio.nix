{ config, pkgs, ... }: {

  # PulseAudio desligado — PipeWire assume o papel
  services.pulseaudio.enable = false;

  # RTKit — prioridade de tempo real para processos de áudio
  security.rtkit.enable = true;

  # PipeWire — servidor de áudio principal
  services.pipewire = {
    enable           = true;
    alsa.enable      = true;
    alsa.support32Bit = true;
    pulse.enable     = true;   # emula PulseAudio
    jack.enable      = true;   # emula JACK — necessário pro Reaper
    wireplumber.enable = true;
  };

  # Configuração padrão do PipeWire — mixagem (1024) ou gravação via script
  services.pipewire.extraConfig.pipewire."92-low-latency" = {
    context.properties = {
      default.clock.rate        = 48000;
      default.clock.quantum     = 1024;
      default.clock.min-quantum = 32;
      default.clock.max-quantum = 8192;
    };
  };

  # Emulação PulseAudio
  services.pipewire.extraConfig.pipewire-pulse."92-low-latency" = {
    context.modules = [
      {
        name = "libpipewire-module-protocol-pulse";
        args = {
          pulse.min.req     = "32/48000";
          pulse.default.req = "1024/48000";
          pulse.max.req     = "8192/48000";
          pulse.min.quantum = "32/48000";
          pulse.max.quantum = "8192/48000";
        };
      }
    ];
    stream.properties = {
      node.latency    = "1024/48000";
      resample.quality = 4;
    };
  };

  # Desativa C-states para menor latência de áudio
  boot.kernelParams = [ "processor.max_cstate=1" ];

  # implicit_fb — corrige tick periódico em interfaces USB (Scarlett, MOD Duo, etc.)
  boot.extraModprobeConfig = ''
    options snd-usb-audio implicit_fb=1
  '';

  environment.systemPackages = with pkgs; [
    crosspipe       # patchbay visual para PipeWire
    qpwgraph        # patchbay PipeWire com conexões persistentes
  ];
}
