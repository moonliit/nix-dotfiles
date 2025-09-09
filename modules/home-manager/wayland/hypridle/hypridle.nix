{ config, pkgs, ... }:

{
    programs.hypridle = {
        enable = true;
        settings = {
            general = {
                lock_cmd = "pidof hyprlock || hyprlock"; # lock screen
                before_sleep_cmd = "loginctl lock-session"; # lock before sleep
                after_sleep_cmd = ""; # optional
            };

            listener = [
                {
                    timeout = 300; # seconds (5 min)
                    on-timeout = "hyprlock"; # run when idle
                    on-resume = "";          # when resumed
                }
                {
                    timeout = 600; # 10 min
                    on-timeout = "systemctl suspend";
                    on-resume = "";
                }
            ];
        };
    };
}
