{ ... }:

{
  xdg.configFile = {
    "wezterm/wezterm.lua".source = ./wezterm.lua;
  };
  # programs.wezterm = {
  #   enable = true;
  #   extraConfig = builtins.readFile ./wezterm.lua;
  # };
}
