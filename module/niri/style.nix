{ inputs, pkgs, ... }:

{
  programs.niri.settings = {
    layout = {
      focus-ring.enable = false;
      border = {
        enable = true;
        width = 2;
        active.color = "rgba(255,255,255,0.3)";
        inactive.color = "rgba(100,100,100,0.3)";
      };

      default-column-width = {
        proportion = 1.0 / 2.0;
      };

      preset-column-widths = [
        { proportion = 1.0 / 3.0; }
        { proportion = 1.0 / 2.0; }
        { proportion = 2.0 / 3.0; }
        { proportion = 1.0; }
      ];

      gaps = 8;
      struts = {
        left = 0;
        right = 0;
        top = 0;
        bottom = 0;
      };
    };
  };
}
