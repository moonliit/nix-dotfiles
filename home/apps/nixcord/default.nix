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
        blurNsfw.enable = true;
        callTimer.enable = true;
        crashHandler.enable = true;
        disableCallIdle.enable = true;
        fakeNitro.enable = true;
        decor.enable = true;
      };

      themeLinks = [
        "https://devevil99.github.io/devevil/BetterDiscordAddons/Theme/Dark%2B/Dark%2B-Default-Member-List.css"
        "https://catppuccin.github.io/discord/dist/catppuccin-macchiato.theme.css"
        "https://catppuccin.github.io/discord/dist/catppuccin-frappe.theme.css"
        "https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css"
      ];

    };
  };
}
