{ config, pkgs, ... }:

{
    imports = [
        ../module/git
        ../module/fastfetch
        ../module/starship
    ];

    home.username = "noharu";
    home.homeDirectory = "/Users/noharu"

    programs.zoxide = {
        enable = true;
    };

    home.stateVersion = "24.11";
}
