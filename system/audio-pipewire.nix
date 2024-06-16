{ config, pkgs, ... }: {

security.rtkit.enable = true;

## PROGRAMS
   ##PATCHBAY

    environment.systemPackages = with pkgs; [
       helvum
       bluez
       ];
       

##PIPEWIRE CONFIG 
  ##ENABLE PIPEWIRE
     services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
        };
  ##LOW LATENCY CONFIG
     services.pipewire.extraConfig.pipewire."92-low-latency" = {
         context.properties = {
         default.clock.rate = 48000;
         default.clock.quantum = 32;
         default.clock.min-quantum = 32;
         default.clock.max-quantum = 32;
         };
 };     
   ##LOW LATENCY CONFIG PULSE
    services.pipewire.extraConfig.pipewire-pulse."92-low-latency" = {
     context.modules = [
       {
         name = "libpipewire-module-protocol-pulse";
         args = {
           pulse.min.req = "32/48000";
           pulse.default.req = "32/48000";
           pulse.max.req = "32/48000";
           pulse.min.quantum = "32/48000";
           pulse.max.quantum = "32/48000";
         };
       }
     ];
     stream.properties = {
       node.latency = "32/48000";
       resample.quality = 1;
     };
   }; 
services.pipewire.wireplumber.enable = true;
services.pipewire.wireplumber.extraConfig = {
  "monitor.bluez.properties" = {
      "bluez5.enable-sbc-xq" = true;
      "bluez5.enable-msbc" = true;
      "bluez5.enable-hw-volume" = true;
      "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
  };
};

#environment.etc."wireplumber/main.lua.d/99-alsa-lowlatency.lua".text = ''
#  alsa_monitor.rules = {
#    {
#      matches = {{{ "node.name", "matches", "alsa_output.*" }}};
#      apply_properties = {
#        ["audio.format"] = "S32LE",
#        ["audio.rate"] = "96000", -- for USB soundcards it should be twice your desired rate
#        ["api.alsa.period-size"] = 2, -- defaults to 1024, tweak by trial-and-error
#        -- ["api.alsa.disable-batch"] = true, -- generally, USB soundcards use the batch mode
#      },
#    },
#  }
#'';
}