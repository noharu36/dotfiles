{ pkgs, lib, ... }:

{
    imports = [
        ./homebrew.nix
    ];
    nix.enable = false;
    nixpkgs.config.allowUnfree = true;

    system.primaryUser = "noharu";

    fonts.packages = with pkgs; [
        nerd-fonts._3270       
        nerd-fonts.hack
        nerd-fonts.bigblue-terminal
    ];

    programs.zsh.enable = true;

    environment.systemPackages = with pkgs; [
        git
        vim
        rustup
    ];

    programs.nix-index-database.comma = {
        enable = true;
    };

    system.stateVersion = 5;
}
