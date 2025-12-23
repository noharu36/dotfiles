{ config, pkgs, lib, ... }:

{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        shellAliases = {
            gs = "git status";
            dr = "sudo darwin-rebuild switch --flake ~/.dotfiles#myMacBook && exec $SHELL -l";
        };

        sessionVariables = {
            TIMEFMT = "\n\n========================\nProgram : %J\nCPU     : %P\nuser    : %*Us\nsystem  : %*Ss\ntotal   : %*Es\n========================\n";
            GOPATH = "$HOME/go";
            PYENV_ROOT = "$HOME/.pyenv";
            LIBRARY_PATH = "$LIBRARY_PATH:/opt/homebrew/lib";
            PS1 = "@noharu %1~ %# ";
        };

        initContent = ''
            if [ "$(arch)" = "arm64" ]; then
                eval "$(/opt/homebrew/bin/brew shellenv)"
            else
                eval "$(/usr/local/bin/brew shellenv)"
            fi

            function cl {
                if [ -z "$1" ]; then
                    echo "Usage: cl <extension>"
                    return 1
                fi
                local extension="$1"
                git ls-files | grep "\\.''${extension}$" | xargs wc -l
            }

            if [[ "$TERM_PROGRAM" == "alacritty" ]]; then
                ZELLIJ_AUTO_ATTACH=true
                ZELLIJ_AUTO_EXIT=true
                if [[ -z "$ZELLIJ" ]]; then
                    if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
                        zellij attach -c
                    else
                        zellij
                    fi
                    if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
                        exit
                    fi
                fi
            fi

            [[ -d ~/.rbenv ]] && eval "$(rbenv init -)"

            [ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

            if command -v go1.24.2 >/dev/null 2>&1; then
                export GOROOT=$(go1.24.2 env GOROOT)
                export PATH=$GOROOT/bin:$PATH
            fi

            if [ -f '/Users/noharu/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/noharu/google-cloud-sdk/path.zsh.inc'; fi
            if [ -f '/Users/noharu/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/noharu/google-cloud-sdk/completion.zsh.inc'; fi

            [ -f "/Users/noharu/.ghcup/env" ] && . "/Users/noharu/.ghcup/env"
            if command -v stack >/dev/null 2>&1; then
                export PATH=$PATH:$(stack path --bin-path)
            fi
        '';
    };
}
