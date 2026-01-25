{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ../../module/anyrun
    ../../module/git
    ../../module/starship
    ../../module/nushell
    ../../module/fastfetch
    ../../module/neovim
    ../../module/wezterm
    ../../module/swayosd.nix
    ../../module/niri
    ../../module/waybar
    ../../module/zed
  ];

  home.username = "harukun";
  home.homeDirectory = "/home/harukun";

  home.stateVersion = "24.11";

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
    commandLineArgs = [
      "--enable-features=UseOzonePlatfor"
      "--ozone-platform=x11"
    ];
  };

  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
  };

  home.sessionVariables = {
    # SHELL = "nushell";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };

  programs.home-manager.enable = true;
}
