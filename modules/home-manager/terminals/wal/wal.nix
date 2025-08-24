{ config, pkgs, ... }:

let
  colors = builtins.fromJSON (builtins.readFile ./colors.json);

  # Generate ANSI escape sequences
  sequences = ''
    # Foreground
    \u001b]10;${colors.special.foreground}\a
    # Background
    \u001b]11;${colors.special.background}\a
    # Cursor
    \u001b]12;${colors.special.cursor}\a
  '' + (builtins.concatStringsSep "\n" (
    builtins.attrValues (builtins.mapAttrs (name: value:
      let index = builtins.fromJSON (builtins.toJSON (builtins.substring 5 (builtins.stringLength name) name)); in
      "\u001b]4;${toString index};${value}\a"
    ) colors.colors)
  ));

in
{
  # Write sequences to a file inside /etc
  environment.etc."wal-sequences".text = sequences;

  # Apply sequences at shell init
  programs.zsh.initExtra = ''
    if [ -f /etc/wal-sequences ]; then
      cat /etc/wal-sequences
    fi
  '';
}

