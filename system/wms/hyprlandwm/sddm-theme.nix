{pkgs }:

pkgs.stdenv.mkDerivation {
  name = "sddm-flower-theme";
  src = pkgs.fetchFromGitHub {
     owner = "Keyitdev";
     repo = "sddm-flower-theme";
     rev = "5981c873c203136b59da9ed941139abea1aaa02b";
     sha256 = "0sszdvk21lyl8p8wvv10cazwqiqddiqpmcb7yrjcxpq52ih0lfga";
  };
installPhase = ''
  mkdir -p $out
  cp -R ./* $out/
'';
}