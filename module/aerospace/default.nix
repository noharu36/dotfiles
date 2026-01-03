{ config, pkgs, lib, ... }:

{
    imports = [
        ./binds.nix
        ./style.nix
        ./rules.nix
    ];

    programs.aerospace = {
        enable = true;
        launchd.enable = true;
        settings = {
            exec-on-workspace-change = [
                "/bin/zsh"
                "-c"
                "sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$(/etc/profiles/per-user/noharu/bin/aerospace list-workspaces --focused)"
            ];
            enable-normalization-flatten-containers = true;
            enable-normalization-opposite-orientation-for-nested-containers = true;
            accordion-padding = 0;
            on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];
            workspace-to-monitor-force-assignment = {
                "1" = "main";
                "2" = "main";
                "3" = "main";
                "4" = "main";
                "5" = "main";
                "6" = "main";
                "7" = "main";
                "8" = "main";
                "9" = "main";
                "10" = "secondary";
            };
        };
    };
}
