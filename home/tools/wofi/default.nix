{ pkgs, ... }:

{
  programs.wofi = {
    enable = true;
    package = pkgs.wofi;

    settings = {
      show = "drun";
      location = "top";
      show_actions = false;
      width = 700;
      allow_images = true;
      image_size = 40;
      allow_markup = true;
      term = "kitty";
      yoffset = 176;
    };

    style = builtins.readFile ./style.css;
  };
}
