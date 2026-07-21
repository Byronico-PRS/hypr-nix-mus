{ pkgs }:

pkgs.writeShellScriptBin "audio-normal" ''
  pw-metadata -n settings 0 clock.force-quantum 0
  echo "Modo normal: quantum 1024 (~21ms de latência)"
''
