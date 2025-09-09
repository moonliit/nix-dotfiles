{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = 0.75;
      font_size = 12;
      font_family = "0xProtoNerdFontMono";
      window_padding_width = 10;
      confirm_os_window_close = "0";
    };
  };
}
