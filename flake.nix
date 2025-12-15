{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anyrun.url = "github:anyrun-org/anyrun";
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = inputs: {
    nixosConfigurations = {
      myNixOS = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	specialArgs = {inherit inputs;};
	modules = [
	  ./overlays.nix

	  ./hosts/thinkbookG5/configuration.nix

	  inputs.home-manager.nixosModules.home-manager {
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

    darwinConfigurations = {
        myMacBook = inputs.nix-darwin.lib.darwinSystem {
            system = "aarch64-darwin";
            modules = [
                ./hosts/macbook/configuration.nix

                inputs.home-manager.darwinModules.home-manager {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.backupFileExtension = "backup";
                    home-manager.users.noharu = import ./home/macbook.nix;
                }
            ];
            specialArgs = { inherit inputs; };
        };
    };
  };
}
