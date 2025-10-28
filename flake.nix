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

    # Extra packages
    nixcord.url = "github:kaylorben/nixcord";
    nixowos.url = "github:yunfachi/nixowos";
    nixvim.url = "github:nix-community/nixvim";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # standalone home-manager configuration
      homeConfigurations.moonliit = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };

        modules = [
          ./home/home.nix
          inputs.nixcord.homeModules.nixcord
          inputs.nixowos.homeModules.default
          inputs.nixvim.homeModules.nixvim
          inputs.zen-browser.homeModules.beta

          ({ config, pkgs, lib, ... }: {
            # allow unfree packages
            nixpkgs.config.allowUnfree = true;
            # add overlays
            nixpkgs.overlays = [
              inputs.nur.overlays.default
              inputs.rust-overlay.overlays.default
            ];
          })
        ];
      };

      # nixos configuration
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = system;
        specialArgs = { inherit inputs; };

        modules = [
          ./hosts/nixos/configuration.nix

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
