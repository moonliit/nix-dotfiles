{ config, pkgs, lib, inputs, ... }:

let
  inVBox = false;
  isLatam = false;
  wallpaper = "oneshot.jpg";
in
{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
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
  environment.variables = import ./env-vars.nix;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Lima";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = pkgs.lib.mkForce (
      if isLatam then "la-latin1" else "us"
    );
  };

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    windowManager.qtile.enable = true;
    resolutions = [
      { x = 1920; y = 1200; }
    ];
    displayManager.sessionCommands = ''
      xwallpaper --zoom ~/Dotfiles/wallpapers/${wallpaper}
      xset r rate 200 35 &
    '';
  };

  # Libinput settings for touchpad support
  services.libinput = {
    enable = true;
    touchpad.naturalScrolling = true;
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
    layout = if isLatam then "latam" else "us";
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
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Enable programs
  programs.zsh.enable = true;
  programs.firefox.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.moonliit = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  # List packages installed in system profile.
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = import ./packages.nix { inherit pkgs; };

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

  system.stateVersion = "25.05";
}
