{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-25.05";

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    kickstart-nvim = {
      url = "github:nix-community/kickstart-nix.nvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # Extra packages
    nixcord.url = "github:kaylorben/nixcord";
    nixowos.url = "github:yunfachi/nixowos";
  };

  outputs = { self, nixpkgs, ... } @ inputs:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = system;
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
        
        ({ config, pkgs, lib, ... }: {
          # allow unfree packages
          nixpkgs.config.allowUnfree = true;
          # add overlays
          nixpkgs.overlays = [
            inputs.nur.overlays.default
            inputs.rust-overlay.overlays.default
            inputs.kickstart-nvim.overlays.default
          ];
          # system pkgs
          environment.systemPackages = [
            pkgs.rust-bin.stable.latest.default
          ];
        })

        inputs.nixowos.nixosModules.default
      ];
    };
  };
}
