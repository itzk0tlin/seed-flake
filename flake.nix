{
  description = "A very lightweight system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 

    let
      system = "x86_64-linux";
    in {
      # workstation is your hostname
      nixosConfigurations.workstation = nixpkgs.lib.nixosSystem {
        specialArgs = {
          nixpkgs.config.allowUnfree = true;
          inherit inputs system;
        };
        modules = [
          ./systems/workstation/configuration.nix
          inputs.stylix.nixosModules.stylix
        ];
      };

      homeConfigurations.nefavel = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          ./home/nefavel/home.nix
          inputs.stylix.homeModules.stylix
        ];
      };

  };
}
