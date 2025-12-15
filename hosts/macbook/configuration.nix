{ pkgs, ... }:

{
    nix = {
        settings = {
            auto-optimise-store = true;
            experimental-features = ["nix-command" "flakes"];
        };
        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 7d";
        };
    };

    services.nix-daemon.enable = true;

    environment.systemPackages = with pkgs; [
        git
        vim
    ];

    system.stateVersion = 5;
}
