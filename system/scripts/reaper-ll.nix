{ pkgs }:

pkgs.writeShellScriptBin "reaper-ll"''
    #!/bin/sh
     PIPEWIRE_LATENCY="128/48000" reaper
''