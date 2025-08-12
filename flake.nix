{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    lib = pkgs.lib;
  in
  {
    # Host configuration
    nixosConfigurations = {
      flake = pkgs.lib.nixosSystem {
        inherit system;
	modules = [
          ./modules/system/configuration.nix
	  home-manager.nixosModules.home-manager
	];
      };
    };
  };
}
