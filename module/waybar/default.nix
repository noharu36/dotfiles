{pkgs, ...}:
{
  programs.waybar = {
  	enable = true;
  	# systemd.target = "niri-session";
  };
  imports = [
    ./settings.nix
    # ./style.nix
  ];
}
