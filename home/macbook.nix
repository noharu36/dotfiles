{ config, pkgs, lib, ... }:

{
    imports = [
        ../module/zsh
        ../module/git
        ../module/fastfetch
        ../module/starship
        ../module/neovim
        ../module/aerospace
        ../module/sketchybar
        ../module/jankyborders
        ../module/alacritty
        ../module/rio
    ];

    # i18n.inputMethod.enabled = lib.mkForce null;

    home.username = lib.mkForce "noharu";
    home.homeDirectory = lib.mkForce "/Users/noharu";

    home.sessionPath = [
            "/opt/homebrew/opt/openjdk/bin"
            "/opt/homebrew/opt/make/libexec/gnubin"
            "$HOME/.local/bin"
            "$GOPATH/bin"
            "/opt/homebrew/opt/llvm/bin"
            "$PYENV_ROOT/bin"
    ];

    home.sessionVariables = {
        XDG_CONFIG_HOME = "$HOME/.config";
        CONFIG_DIR = "$HOME/.config";
    };

    home.file = {
        ".hushlogin".text = "";
    };

    home.packages = with pkgs; [
        docker
        ffmpeg
        gitmoji-cli
        llvm
        macchina
        qemu
        sl
        sqlite
        tree
        presenterm
    ];

    programs = {
        zoxide.enable = true;
        bat.enable = true;
        bottom.enable = true;
        ripgrep.enable = true;
    };

    programs.zellij = {
        enable = false;
        enableZshIntegration = true;
    };

    home.stateVersion = "25.11";
}
