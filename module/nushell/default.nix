{config, pkgs, inputs, ...}:

{
  programs.nushell = {
    enable = true;
    # configFile.source = ./config.nu;
    # envFile.source = ./env.nu;
    shellAliases = {
      gs = "git status";
      rebuild = "sudo nixos-rebuild switch --impure --flake ~/.dotfiles/#myNixOS";
      nixconf = "sudo nvim ~/.dotfiles/host/thinkbookG5/configuration.nix";
    };
  };
}
