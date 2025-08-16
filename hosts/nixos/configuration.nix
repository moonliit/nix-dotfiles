{ config, pkgs, lib, inputs, ... }:

let
  inVBox = true;
in
{
  imports =
    [
      ./hardware-configuration.nix
      # inputs.home-manager.nixosModules.default
    ];

  # Host level overrides
  networking.hostName = "nixos";

  # Enable home manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    
    users = {
      "moonliit" = import ../../modules/home-manager/home.nix;
    };
  }; 

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Environment variables
  environment.variables = {
    NIXOS_CONFIG_DIR = "$HOME/Dotfiles";
    NIXOS_CONFIG = "$HOME/Dotfiles/hosts/nixos/configuration.nix";
    NIXOS_MODULES_DIR = "$HOME/Dotfiles/modules";
    EDITOR = "nvim";
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "America/Lima";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = pkgs.lib.mkForce "la-latin1";
  };

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    windowManager.qtile.enable = true;
    displayManager.sessionCommands = ''
      xwallpaper --maximize ~/wallpapers/ena.jpg
      xset r rate 200 35 &
    '';
  };

  # Picom compositor
  services.picom = {
    enable = true;

    # Choose backend automatically
    backend = lib.mkForce (if inVBox then "xrender" else "glx");

    # Safer defaults for portability
    fade = true;
    settings = {
      vsync = true;
    };
  };

  # VirtualBox guest additions for the VM
  virtualisation.virtualbox.guest = {
    enable = inVBox;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "latam";
  };

  # Fonts
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts._0xproto # 0xProtoNerdFont
    ];
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  
  # Enable bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.moonliit = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };
  programs.firefox.enable = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    vim
    wget
    neovim
    kitty
    btop
    gedit
    bat
    xwallpaper
    git
    fastfetch
    hyfetch
    starship
    pywal16
    zsh
    pcmanfm
    rofi
    gh
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?

}

