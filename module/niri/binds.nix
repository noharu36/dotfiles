{config, inputs, pkgs, ...}:

{
  programs.niri.settings.binds = with config.lib.niri.actions; {
    # Fn key bind
    "XF86AudioMute".action = spawn "swayosd-client" "--output-volume=mute-toggle";
    "XF86AudioMicMute".action = spawn "swayosd-client" "--input-volume=mute-toggle";
    "XF86AudioRaiseVolume".action = spawn "swayosd-client" "--output-volume=raise";
    "XF86AudioLowerVolume".action = spawn "swayosd-client" "--output-volume=lower";
    "XF86MonBrightnessUp".action = spawn "swayosd-client" "--brightness=raise";
    "XF86MonBrightnessDown".action = spawn "swayosd-client" "--brightness=lower";
    # "Print".action = screenshot-screen;
    "Print".action = spawn "grim" "~/Pictures/ScreenShots/$(date +'Screenshot-from-%Y-%m-%d-%H-%M-%S.png')";
    "Mod+Print".action = screenshot-window;

    # Running the App
    "Mod+D".action = spawn "uwsm" "app" "--" "${pkgs.anyrun}/bin/anyrun";
    "Mod+Return".action = spawn "uwsm" "app" "--" "${pkgs.wezterm}/bin/wezterm";
    "Mod+Shift+Return".action = spawn "uwsm" "app" "--" "google-chrome-stable";

    # "Mod+Shift+S".action = screenshot;
    "Mod+Shift+S".action = spawn "grim" "-g" "\"$(slurp)\"" "~/Pictures/ScreenShots/$(date +'Screenshot-from-%Y-%m-%d-%H-%M-%S.png')";

    # Window action
    "Mod+Shift+Q".action = close-window;
    "Mod+F".action = maximize-column;
    "Mod+Shift+F".action = fullscreen-window;
    "Mod+R".action = switch-preset-column-width;
    "Mod+Shift+R".action = switch-preset-window-height;
    "Mod+Ctrl+R".action = reset-window-height;
    "Mod+Shift+E".action = quit {skip-confirmation = false;};
    "Mod+Shift+Slash".action = show-hotkey-overlay;
    "Mod+Shift+Space".action = toggle-window-floating;
    "Mod+Space".action = switch-focus-between-floating-and-tiling;
    "Mod+C".action = consume-window-into-column;
    "Mod+X".action = expel-window-from-column;

    "Mod+Left".action = focus-column-or-monitor-left;
    "Mod+Right".action = focus-column-or-monitor-right;
    "Mod+Up".action = focus-window-or-workspace-up;
    "Mod+Down".action = focus-window-or-workspace-down;

    "Mod+H".action = focus-column-or-monitor-left;
    "Mod+L".action = focus-column-or-monitor-right;
    "Mod+K".action = focus-window-or-workspace-up;
    "Mod+J".action = focus-window-or-workspace-down;

    "Mod+1".action = focus-workspace 1;
    "Mod+2".action = focus-workspace 2;
    "Mod+3".action = focus-workspace 3;
    "Mod+4".action = focus-workspace 4;
    "Mod+5".action = focus-workspace 5;
    "Mod+6".action = focus-workspace 6;
    "Mod+7".action = focus-workspace 7;
    "Mod+8".action = focus-workspace 8;
    "Mod+9".action = focus-workspace 9;

    "Mod+Shift+Left".action = move-column-left-or-to-monitor-left;
    "Mod+Shift+Right".action = move-column-right-or-to-monitor-right;
    "Mod+Shift+Up".action = move-window-up-or-to-workspace-up;
    "Mod+Shift+Down".action = move-window-down-or-to-workspace-down;

    "Mod+Shift+H".action = move-column-left-or-to-monitor-left;
    "Mod+Shift+L".action = move-column-right-or-to-monitor-right;
    "Mod+Shift+K".action = move-window-up-or-to-workspace-up;
    "Mod+Shift+J".action = move-window-down-or-to-workspace-down;

    "Mod+Shift+1".action = move-window-to-workspace 1;
    "Mod+Shift+2".action = move-window-to-workspace 2;
    "Mod+Shift+3".action = move-window-to-workspace 3;
    "Mod+Shift+4".action = move-window-to-workspace 4;
    "Mod+Shift+5".action = move-window-to-workspace 5;
    "Mod+Shift+6".action = move-window-to-workspace 6;
    "Mod+Shift+7".action = move-window-to-workspace 7;
    "Mod+Shift+8".action = move-window-to-workspace 8;
    "Mod+Shift+9".action = move-window-to-workspace 9;
  };
}
