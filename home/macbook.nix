{
  config,
  pkgs,
  lib,
  ...
}:

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
    ../module/vscode
    ../module/antigravity
  ];

  # i18n.inputMethod.enabled = lib.mkForce null;

  home.sessionPath = [
    "/opt/homebrew/opt/openjdk/bin"
    "/opt/homebrew/opt/make/libexec/gnubin"
    "$HOME/.local/bin"
    "$HOME/.antigravity/antigravity/bin"
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

  home.activation.fixAntigravity = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    app_path="$HOME/Applications/Home Manager Apps/Antigravity.app"

    if [ -e "$app_path" ]; then
        /usr/bin/xattr -cr "$app_path" || echo "Note: Failed to clear xattr. If the app doesn't open, run 'sudo xattr -cr ...' manually."
    fi
  '';
}
