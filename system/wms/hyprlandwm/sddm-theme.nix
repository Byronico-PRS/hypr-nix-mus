{pkgs }:

pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
     owner = " ";
     repo = "";
     rev = "";
     sha256 = "";
  };
installPhase = ''
  mkdir -p $out
  cp -R ./* $out/
'';
};