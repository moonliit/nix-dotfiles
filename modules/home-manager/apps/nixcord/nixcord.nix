{ config, pkgs, ... }:

{
  programs.nixcord = {
    enable = true;
    vesktop.enable = true;

    # don’t enable Dorion until you’ve run it once manually (see README)
    # dorion.enable = true;

    quickCss = ''
      body { background-color: #181825; }
    '';

    config = {
      useQuickCss = true;
      
      plugins = {
        betterGifPicker.enable = true;
        blurNSFW.enable = true;
        callTimer.enable = true;
	crashHandler.enable = true;
	disableCallIdle.enable = true;
	fakeNitro.enable = true;
      };
    
      themeLinks = [
        "https://catppuccin.github.io/discord/dist/catppuccin-macchiato.theme.css"
        "https://catppuccin.github.io/discord/dist/catppuccin-frappe.theme.css"
        "https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css"
      ];

    };
  };
}
