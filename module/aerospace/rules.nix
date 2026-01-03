{ config, pkgs, lib, ... }:

{
    programs.aerospace.settings = {
        on-window-detected = [
            {
                # terminal
                "if".app-id = "com.raphaelamorim.rio";
                run = [ "move-node-to-workspace 1 "];
            }
            {
                # arc
                "if".app-id = "company.thebrowser.Browser";
                run = [ "move-node-to-workspace 2 "];
            }
            {
                # slack
                "if".app-id = "com.tinyspeck.slackmacgap";
                run = [ "move-node-to-workspace 3 "];
            }
            {
                # discord
                "if".app-id = "com.hnc.Discord";
                run = [ "move-node-to-workspace 3 "];
            }
            {
                # obsidian
                "if".app-id = "md.obsidian";
                run = [ "move-node-to-workspace 4 "];
            }
            {
                # chrome
                "if".app-id = "com.google.Chrome";
                run = [ "layout floating" "move-node-to-workspace 8 "];
            }
            {
                # vmware
                "if".app-id = "com.vmware.fusion";
                run = [ "move-node-to-workspace 9 "];
            }
        ];
    };
}
