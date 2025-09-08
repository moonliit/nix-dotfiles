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
        hideAttachments.enable = true;
        ignoreActivities = {
          enable = true;
          ignorePlaying = true;
        };
      };
    }
  };
}
