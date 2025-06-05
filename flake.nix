{
  description = "A very lightweight system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 

    let
      system = "x86_64-linux";
    in {
                        # this is your hostname
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {
          nixpkgs.config.allowUnfree = true;
          inherit inputs system;
        };
        modules = [
          ./your-system/configuration.nix
          # home-manager.nixosModules.home-manager
          # {
          #   home-manager.useGlobalPkgs = true;
          #   home-manager.useUserPackages = true;
          #   home-manager.users.nefavel = import ./your-space/home.nix;
          # }
          inputs.stylix.nixosModules.stylix
        ];
      };

      homeConfigurations.nefavel = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          ./your-space/home.nix
          inputs.stylix.homeModules.stylix
        ];
      };

  };
}
