{ pkgs }:

{
  prideTheme = pkgs.vscode-utils.buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "pride-vscode-themes";
      publisher = "CharlieGerard";
      version = "0.0.4";
      sha256 = "1lcfbfckbrviiplvp52fcnizikk3vy6wyi1j44243l0pg0h8fpp3";
    };
  };
}

