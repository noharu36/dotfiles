{ pkgs, ... }:

{
    homebrew = {
        enable = true;

        onActivation = {
            cleanup = "none";
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
            "bruno"
            "rio"
            "utm"
            "wezterm@nightly"
        ];
    };
}
