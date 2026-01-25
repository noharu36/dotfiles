{
  config,
  pkgs,
  lib,
  ...
}:

{
  services.jankyborders = {
    enable = true;
    settings = {
      style = "round";
      width = 4.0;
      hidpi = "on";
      active_color = "0xc0ff00f2";
      inactive_color = "0xff0080ff";
    };
  };
}
