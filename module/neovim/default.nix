{ ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    withRuby = false;
    withPython3 = false;

    initLua = ''
        require("config.options")
        require("config.keymaps")
        require("config.lazy")
    '';
  };
}
