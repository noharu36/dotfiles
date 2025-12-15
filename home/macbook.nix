{ config, pkgs, lib, ... }:

{
    imports = [
        ../module/git
        ../module/fastfetch
        ../module/starship
    ];

    # i18n.inputMethod.enabled = lib.mkForce null;

    home.username = lib.mkForce "noharu";
    home.homeDirectory = lib.mkForce "/Users/noharu";

    programs.zoxide = {
        enable = true;
    };

    home.stateVersion = "24.11";
}
