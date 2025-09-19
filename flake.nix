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

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvchad-starter = {
      url = "path:./modules/home-manager/tools/nvchad/starter";
      flake = false;
    };

    nix4nvchad = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nvchad-starter.follows = "nvchad-starter";
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

          inputs.home-manager.nixosModules.default
          {
            # home-manager settings
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.moonliit = import ./modules/home-manager/home.nix;

            # Shared home-manager modules
            home-manager.sharedModules = [
              inputs.nixvim.homeModules.nixvim
              inputs.nix4nvchad.homeManagerModules.default
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
