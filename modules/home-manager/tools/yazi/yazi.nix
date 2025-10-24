{ config, pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      # top-level TOML structure written to $XDG_CONFIG_HOME/yazi/yazi.toml
      mgr = {
        # enable mouse events that plugins / UI can receive
        mouse_events = [ "click" "scroll" "touch" "move" "drag" ];
      };

      # example: small helpful extras (optional)
      preview = {
        image_delay = 50;   # ms, reduce if previews are too slow
      };
    };
  };
}
