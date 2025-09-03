{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = [
      {
        layer = "top";
        position = "top";
        height = 35;

        # Layout: left | center | right
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "tray" "pulseaudio" "backlight" "battery" "network" "custom/powermenu" ];

        # Clock
        "clock" = {
	  interval = 60;
	  format = "{:%d %b %Y | %I:%M %p}";
          tooltip-format = "<tt><big>{calendar}</big></tt>";
	};

        # PipeWire audio (waybar still uses "pulseaudio" module, but it talks to PipeWire)
        "pulseaudio" = {
          format = "{volume}% {icon}";
          format-muted = "{volume}% 󰝟";
          format-icons = [ "" "" "" ];
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
        };

        # Brightness (via light)
        "backlight" = {
          format = "{percent}% ";
          interval = 2;
          on-scroll-up = "${pkgs.light}/bin/light -A 5";
          on-scroll-down = "${pkgs.light}/bin/light -U 5";
        };

        # Battery
        "battery" = {
          format = "{capacity}% {icon}";
          format-charging = "{capacity}%  {icon}";
          format-icons = [ "" "" "" "" "" ];
        };

        # Network
        "network" = {
          format-wifi = " {essid}";
          format-ethernet = "󰈁 {ipaddr}";
          format-disconnected = "";
          interval = 5;
        };

	# Custom power menu
	"custom/powermenu" = {
          format = "⏻";
	  tooltip = false;
	  on-click = "wlogout -b 3 -T 200 -B 200";
	};
      }
    ];

    style = builtins.readFile ./style.css;
  };
}

