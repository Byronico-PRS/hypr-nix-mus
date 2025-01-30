{ pkgs }:

pkgs.writeShellScriptBin "calendar"''
    #!/bin/bash
    yad --calendar --undecorated --fixed --no-buttons --posx=1000 --posy=30 --width=300 --height=250
 
''