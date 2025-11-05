{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = [
      {
        layer = "top";
        position = "top";
        exclusive = true;
        height = 35;

        # Layout: left | center | right
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "tray" "pulseaudio" "backlight" "battery" "network" "custom/swaync" "custom/powermenu" ];

        # Clock
        "clock" = {
          interval = 60;
          format = "{:%d %b %Y | %I:%M %p}";
          tooltip-format = "<tt><big>{calendar}</big></tt>";
        };

        # PipeWire audio (waybar still uses "pulseaudio" module, but it talks to PipeWire)
        "pulseaudio" = {
          format = "{icon}  {volume}%";
          format-muted = "󰝟 {volume}%";
          format-icons = [ "" "" "" ];
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
        };

        # Brightness (via light)
        "backlight" = {
          format = "󰃠 {percent}%";
          interval = 2;
        };

        # Battery
        "battery" = {
          interval = 10;
          format = "{icon} {capacity}%";
          format-charging = "{icon}  {capacity}%";
          format-icons = [ "" "" "" "" "" ];
        };

        # Network
        "network" = {
          format-wifi = "  {essid}";
          format-ethernet = "󰈁  {ipaddr}";
          format-disconnected = "";
          interval = 5;
          on-click = "kitty -e impala";
        };

        # Notification center
        "custom/swaync" = {
          tooltip = true;
          format = "{icon}";
          format-icons = {
            notification = "󱅫";
            none = "󰂜";
            dnd-notification = "󰂠";
            dnd-none = "󰪓";
            inhibited-notification = "󰂛";
            inhibited-none = "󰪑";
            dnd-inhibited-notification = "󰂛";
            dnd-inhibited-none = "󰪑";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };

        # Power menu
        "custom/powermenu" = {
          format = "⏻";
          tooltip = false;
          on-click = "wlogout -b 3 -T 200 -B 200";
        };

        # Tray
        "tray" = {
          spacing = 10;
        };
      }
    ];
    style = builtins.readFile ./style.css;
  };
}
