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
            "$HOME/.rbenv/bin"
            "/opt/homebrew/opt/openjdk/bin"
            "/opt/homebrew/opt/make/libexec/gnubin"
            "$HOME/.local/bin"
            "$GOPATH/bin"
            "/opt/homebrew/opt/llvm/bin"
            "$PYENV_ROOT/bin"
    ];


    programs.zoxide = {
        enable = true;
    };

    home.stateVersion = "24.11";
}
