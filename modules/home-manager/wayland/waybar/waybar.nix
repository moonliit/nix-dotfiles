{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = [
      {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 10;

        # Layout: left | center | right
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "backlight" "battery" "network" "tray" ];

        # Clock
        "clock" = {
          format = " {:%H:%M}   {:%Y-%m-%d}";
        };

        # PipeWire audio (waybar still uses "pulseaudio" module, but it talks to PipeWire)
        "pulseaudio" = {
          format = "{volume}% {icon}";
          format-muted = "";
          format-icons = [ "" "" "" ];
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
        };

        # Brightness (via light)
        "backlight" = {
          format = " {percent}%";
          interval = 2;
          on-scroll-up = "${pkgs.light}/bin/light -A 5";
          on-scroll-down = "${pkgs.light}/bin/light -U 5";
        };

        # Battery
        "battery" = {
          format = "{capacity}% {icon}";
          format-charging = " {capacity}%";
          format-icons = [ "" "" "" "" "" ];
        };

        # Network
        "network" = {
          format-wifi = "  {essid}";
          format-ethernet = "  {ipaddr}";
          format-disconnected = "⚠️";
          interval = 5;
        };
      }
    ];

    style = ''
      * {
        font-family: "0xProto Nerd Font";
        font-size: 13px;
      }
      window#waybar {
        background-color: #1e1e2e;
        color: #cdd6f4;
        border-bottom: 2px solid #9a59cf;
      }
      #clock {
        color: #ffcc00;
      }
      #pulseaudio {
        color: #00c3ff;
      }
      #backlight {
        color: #f58d51;
      }
      #battery.charging {
        color: #a6e3a1;
      }
      #battery.critical {
        color: #f38ba8;
      }
      #network {
        color: #16a2ff;
      }
    '';
  };
}

