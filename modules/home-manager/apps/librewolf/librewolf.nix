{ config, pkgs, ... }:

{
  programs.librewolf = {
    enable = true;

    profiles.moonliit = {
      id = 0;
      isDefault = true;

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        #bitwarden
        #bookmarkhub
        #proton-pass
        #vimium
        #darkreader
        #ublock-origin
      ];

       search = {
         # todo
       };

       settings = {
         # todo
       };
    };
  };
}
