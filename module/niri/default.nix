{inputs, pkgs, ...}:

{
  imports = [
    inputs.niri.homeModules.niri
    ./binds.nix
    ./style.nix
    ./rules.nix
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
    settings = {
      environment = {
        GTK_IM_MODULE   = "fcitx";
	QT_IM_MODULE    = "fcitx";
	XMODIFIERS      = "@im=fcitx";
        CLUTTER_BACKEND = "wayland";
        DISPLAY = ":0";
        GDK_BACKEND = "wayland,x11";
        MOZ_ENABLE_WAYLAND = "1";
        NIXOS_OZONE_WL = "1";
        QT_QPA_PLATFORM = "wayland;xcb";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        SDL_VIDEODRIVER = "wayland";
      };
      input.keyboard.xkb = {
        layout = "us";
        model = "pc104";
      };

      input.touchpad = {
        click-method = "clickfinger";
        natural-scroll = true;
        scroll-method = "two-finger";
        tap = true;
        tap-button-map = "left-right-middle";
        accel-profile = "adaptive";
      };

      outputs = {
        "eDP-1" = {
          mode = {
            width = 1920;
            height = 1080;
          };
          # scale = 1.0;
          position = {
            x = 0;
            y = 0;
          };
        };
      };

      cursor = {
        size = 20;
      };

      prefer-no-csd = true;

      spawn-at-startup = [
        {command = ["xwayland-satellite"];}
      ];

      screenshot-path = "~/Pictures/Screenshots/Screenshot-from-%Y-%m-%d-%H-%M-%S.png";
    };
  };
}
