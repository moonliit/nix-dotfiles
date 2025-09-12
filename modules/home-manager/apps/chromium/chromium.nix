{ config, pkgs, ... }:

{
  programs.chromium = {
    enable = true;

    # Proctorio and other extensions
    extensions = [
      "jjkchpdmjjdmalgembblgafllbpcjiei" # Proctorio
    ];
  };
}
