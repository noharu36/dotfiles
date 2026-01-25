{ pkgs, lib, ... }:

pkgs.stdenvNoCC.mkDerivation rec {
  pname = "antigravity";
  version = "1.13.3";

  src = pkgs.fetchurl {
    url = "https://edgedl.me.gvt1.com/edgedl/release2/j0qc3/antigravity/stable/1.13.3-4533425205018624/darwin-arm/Antigravity.dmg";
    sha256 = "1h41j7b4hfdfp8y2yv5gihjp69b4njmbf4r1cnzcpi521ybwp4j4";
  };

  nativeBuildInputs = [ pkgs.undmg ];
  sourceRoot = ".";

  installPhase = ''
    runHook preInstall

    mkdir -p $out/Applications
    cp -r *.app $out/Applications/

    runHook postInstall
  '';

  meta = with lib; {
    description = "Google Antigravity IDE";
    homepage = "https://antigravity.google";
    license = licenses.unfree;
    platforms = [ "aarch64-darwin" ];
  };
}
