{ config, pkgs, ... }:

{
  programs.chromium = {
    enable = true;

    # Proctorio and other extensions
    extensions = [
      "gfolddmfcichcfnghdchbfgpmgodmkjd" # proctorio
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
    ];
  };
}
