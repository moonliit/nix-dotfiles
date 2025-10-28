{ config, pkgs, ... }:

{
  programs.librewolf = {
    enable = true;

    profiles.moonliit = {
      id = 0;
      isDefault = true;

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        bitwarden
        proton-pass
        vimium
        darkreader
        ublock-origin
      ];

      search = {
        # todo
      };

      settings = {
        # Enable all extensions by default
        "extensions.autoDisableScopes" = 0;

        # Don’t clear cookies/site data on shutdown
        "privacy.sanitize.sanitizeOnShutdown" = false;
        "privacy.clearOnShutdown.cookies" = false;
        "privacy.clearOnShutdown.sessions" = false;
        "privacy.clearOnShutdown.history" = false;

        # Keep cookies/session data persistent
        "network.cookie.lifetimePolicy" = 0;

        # Disable “Always use private browsing”
        "browser.privatebrowsing.autostart" = false;

        # Privacy and tracking protection
        "privacy.resistFingerprinting" = false;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.trackingprotection.cryptominings.enabled" = true;
        "privacy.trackingprotection.fingerprinting.enabled" = true;
        "signon.rememberSignons" = true;

        # Enable dark mode in private windows
        "browser.theme.dark-private-windows" = true;
        "extensions.activeThemeID" = "firefox-dark@mozilla.org";
      };
    };
  };
}
