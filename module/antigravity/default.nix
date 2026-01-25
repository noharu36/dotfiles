{ pkgs, ... }:

{
  home.packages = [
    (pkgs.callPackage ./package.nix { })
  ];
  imports = [
    ./config.nix
  ];
}
