{ config, pkgs, lib, ... }:

{
    imports = [
        ../module/zsh
        ../module/git
        ../module/fastfetch
        ../module/starship
        ../module/neovim
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

    home.file = {
        ".config/alacritty/alacritty.toml".source = ../module/alacritty/alacritty.toml;
        ".config/wezterm/wezterm.lua".source = ../module/wezterm/wezterm.lua;
        ".config/rio/config.toml".source = ../module/rio/config.toml;
        ".config/rio/themes".source = ../module/rio/themes;
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

    home.stateVersion = "24.11";
}
