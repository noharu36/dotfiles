{ pkgs, lib, ... }:

{
#    nix = {
#        enable = true;
#        optimise.automatic = true;
#        settings = {
#            experimental-features = ["nix-command" "flakes"];
#        };
#        gc = {
#            automatic = true;
#            interval = { Weekday = 0; Hour = 0; Minute = 0; };
#            options = "--delete-older-than 7d";
#        };
#    };
    programs.zsh.enable = true;
    nix.enable = false;

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        git
        vim
    ];

    programs.nix-index-database.comma = {
        enable = true;
    };


    system.stateVersion = 5;
}
