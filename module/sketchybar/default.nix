{
  config,
  pkgs,
  lib,
  ...
}:

let
  sketchybarConfig = pkgs.runCommand "sketchybar-config" { } ''
    mkdir -p $out
    cp -r ${./config}/* $out/
    chmod -R +x $out
  '';
in
{
  programs.sketchybar = {
    enable = true;
    config = {
      recursive = true;
      source = sketchybarConfig;
    };
  };
}
