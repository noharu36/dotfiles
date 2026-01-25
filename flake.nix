{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs-darwin";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager-darwin = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs-darwin";
    anyrun.url = "github:anyrun-org/anyrun";
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay.url = "github:oxalica/rust-overlay";
    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs =
    { self, ... }@inputs:
    {
      formatter.aarch64-darwin = inputs.nixpkgs.legacyPackages.aarch64-darwin.nixfmt-tree;

      nixosConfigurations = {
        myNixOS = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./overlays.nix

            ./hosts/thinkbookG5/configuration.nix

            inputs.home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.extraSpecialArgs = {
                inherit inputs;
              };
              home-manager.users.harukun = import ./home/thinkbookG5.nix;
            }
          ];
        };
      };

      homeManagerModules.my-mac-config = ./home/macbook.nix;
      darwinModules.default = ./hosts/macbook/configuration.nix;

      darwinConfigurations = {
        myMacBook = inputs.nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            inputs.nix-index-database.darwinModules.nix-index
            inputs.mac-app-util.darwinModules.default
            self.darwinModules.default

            inputs.home-manager-darwin.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.sharedModules = [
                inputs.mac-app-util.homeManagerModules.default
              ];
              home-manager.users.noharu =
                { lib, ... }:
                let
                  cfg = import ./shared/config.nix;
                in
                {
                  imports = [ self.homeManagerModules.my-mac-config ];
                  home.username = lib.mkForce cfg.config.users.darwin.username;
                  home.homeDirectory = lib.mkForce cfg.config.users.darwin.homeDirectory;
                  home.stateVersion = lib.mkForce cfg.system.homeStateVersion;
                };
            }
          ];
          specialArgs = { inherit inputs; };
        };
      };
    };
}
