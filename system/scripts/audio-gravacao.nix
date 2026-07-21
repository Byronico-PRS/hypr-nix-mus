{ pkgs }:

pkgs.writeShellScriptBin "audio-gravacao" ''
  pw-metadata -n settings 0 clock.force-quantum 256
  echo "Modo gravação: quantum 256 (~5.3ms de latência)"
''
