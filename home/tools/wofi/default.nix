{ pkgs, ... }:

{
  programs.wofi = {
    enable = true;
    package = pkgs.wofi;

    settings = {
      show = "drun";         # default mode to show (optional)
      location = "top";      # maps from your 'north' – tweak to taste
      width = 480;           # same width you used in rofi
      # yoffset and xoffset are pixels; rofi calc() can't be used here
      # pick an integer (positive moves down, negative up)
      yoffset = -176;
      # other options: allow_markup = true;
    };
    # point wofi to the CSS file in your home config
    # this will instruct wofi to use that file when launched by HM wrapper
    style = builtins.readFile ./style.css;
  };

  # ensure the style file is written to ~/.config/wofi/style.css
  # if you keep the style in the repo, use .source instead of .text
  #home.file.".config/wofi/style.css".source = styleFile;
}
