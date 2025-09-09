{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # Extra packages
    nixcord.url = "github:kaylorben/nixcord";
    nixowos.url = "github:yunfachi/nixowos";
  };

  outputs = { self, nixpkgs, ... } @ inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/nixos/configuration.nix
        inputs.home-manager.nixosModules.default {
          # home-manager settings
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;
	  home-manager.users.moonliit = import ./modules/home-manager/home.nix;

          # Shared home-manager modules
	  home-manager.sharedModules = [
            inputs.nixcord.homeModules.nixcord
	    inputs.nixowos.homeModules.default
	  ];
	}
      ];
    };
  };
}
