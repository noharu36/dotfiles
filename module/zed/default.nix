{ pkgs, lib, ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "toml"
      "make"
      "go-snippets"
    ];

    userSettings = {
      assistant = {
        enabled = true;
        version = "2";
        default_model = {
          provider = "copilot_chat_models";
          model = "gpt-4o";
        };
      };
      hour_format = "hour24";
      auto_update = true;

      lsp = {
        rust-analyzer = {
          binary = {
            path = lib.getExe pkgs.rust-analyzer;
          };
        };
      };
      vim_mode = true;
      base_keymap = "VSCode";
      theme = {
        mode = "dark";
        light = "One Light";
        dark = "One Dark";
      };
      show_whitespaces = "all";
      ui_font_size = 14;
      buffer_font_size = 14;
    };
  };
}
