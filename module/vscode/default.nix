{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    profiles.default.extensions =
      with pkgs.vscode-extensions;
      [
        ms-vscode.remote-explorer
        ms-vscode-remote.remote-ssh-edit
        ms-vscode.makefile-tools
        twxs.cmake
        ms-vscode.cmake-tools
        ms-vscode.cpptools
        ms-vscode.cpptools-extension-pack

        ms-python.python
        ms-python.debugpy
        ms-azuretools.vscode-containers
        ms-azuretools.vscode-docker
        docker.docker
        ms-ceintl.vscode-language-pack-ja
        formulahendry.auto-rename-tag
        formulahendry.code-runner
        streetsidesoftware.code-spell-checker
        dracula-theme.theme-dracula
        jdinhlife.gruvbox
        hediet.vscode-drawio
        usernamehw.errorlens

        eamodio.gitlens
        golang.go
        graphql.vscode-graphql-syntax
        haskell.haskell
        justusadam.language-haskell

        vincaslt.highlight-matching-tag
        oderwat.indent-rainbow
        rust-lang.rust-analyzer
        jnoortheen.nix-ide
        tomoki1207.pdf
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "cpptools-themes";
          publisher = "ms-vscode";
          version = "2.0.0";
          sha256 = "sha256-YWA5UsA+cgvI66uB9d9smwghmsqf3vZPFNpSCK+DJxc=";
        }
        {
          name = "evilinspector";
          publisher = "saikou9901";
          version = "1.0.8";
          sha256 = "sha256-dO7ifAGelwo913fGWbPH8YAPgZhRCdMm55MDKTC54vM=";
        }
        {
          name = "haskell-linter";
          publisher = "hoovercj";
          version = "0.0.6";
          sha256 = "sha256-MjgqR547GC0tMnBJDMsiB60hJE9iqhKhzP6GLhcLZzk=";
        }
        {
          name = "html-preview-vscode";
          publisher = "george-alisson";
          version = "0.2.5";
          sha256 = "sha256-1kjhNLFRUashPYko5F7p8gNwe+heT4wKAPZiJsTqgdg=";
        }
        {
          name = "path-autocomplete";
          publisher = "ionutvmi";
          version = "1.25.0";
          sha256 = "sha256-iz32o1znwKpbJSdrDYf+GDPC++uGvsCdUuGaQu6AWEo=";
        }
        {
          name = "language-review";
          publisher = "atsushieno";
          version = "0.7.5";
          sha256 = "sha256-zIzQUFUn3xlDX9d5ZqPtjuyoeKW2Qxqao5P/2vtMAHM=";
        }
      ];
    profiles.default.userSettings = {
      "files.autoSave" = "afterDelay";
      "editor.fontSize" = 12;
      "editor.tabSize" = 4;
      "editor.fontFamily" = "Fira Code, Menlo, Monaco, 'Courier New', monospace";
      "editor.fontLigatures" = true;
      "workbench.colorTheme" = "Gruvbox Dark Hard";
    };
  };
}
