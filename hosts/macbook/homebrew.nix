{ ... }:

{
  homebrew = {
    enable = true;

    onActivation = {
      cleanup = "zap";
      extraFlags = [ "--force" ];
      autoUpdate = true;
      upgrade = true;
    };

    brews = [
      "jq"
      "yq"
      "go"
      "weasyprint"
      "katago"
    ];

    casks = [
      "alacritty"
      "antigravity"
      "obsidian"
      "zen"
      "bruno"
      "rio"
      "utm"
      "wezterm@nightly"
      "sf-symbols"
      "sabaki"
    ];
  };
}
