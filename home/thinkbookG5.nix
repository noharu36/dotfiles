{ config, pkgs, inputs, ... }:

let
  cfg = import ../shared/config.nix;
in
{
  imports = [
    ../module/anyrun
    ../module/git
    ../module/starship
    ../module/nushell
    ../module/fastfetch
    ../module/neovim
    ../module/wezterm
    ../module/swayosd.nix
    ../module/niri
    ../module/waybar
    ../module/zed
  ];

  home.username = lib.mkForce cfg.config.users.nixos.username;
  home.homeDirectory = lib.mkForce cfg.config.users.nixos.homeDirectory;

  home.stateVersion = lib.mkForce cfg.system.homeDirectory;
  
  home.packages = with pkgs; [
    waybar
    bottom
    discord
    slack
    xwayland-satellite
    gnumake
    gcc
    go
    rust-bin.stable.latest.default
  ];

  # home.file = {};

  programs.google-chrome = {
    enable = true;
    commandLineArgs = ["--enable-features=UseOzonePlatfor" "--ozone-platform=x11"];
  };

  programs.zoxide = {
      enable = true;
      enableNushellIntegration = true;
  };

  home.sessionVariables = {
    # SHELL = "nushell";
    NIXOS_OZONE_WL="1";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };

  programs.home-manager.enable = true;
}
