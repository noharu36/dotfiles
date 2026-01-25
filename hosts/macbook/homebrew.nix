{ pkgs, ... }:

{
  homebrew = {
    enable = true;

    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };

    brews = [
      "jq"
      "yq"
      "go"
    ];

    casks = [
      "alacritty"
      "obsidian"
      "zen"
      "bruno"
      "rio"
      "utm"
      "wezterm@nightly"
      "sf-symbols"
    ];
  };
}
