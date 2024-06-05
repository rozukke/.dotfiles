# Inherits env from root flake
{ pkgs, sysconfig, userconfig, ... }:

{
  # Should import all non user-level flakes
  imports = 
    [ 
      ./sys/hardware-configuration.nix

      # Discreet hardware config
      ./sys/hardware/gpu.nix
      ./sys/hardware/fprint.nix
      ./sys/network.nix

      # List of system necessary packages
      ./pkg/syspkg.nix
      
      # System configuration
      ./sys/hardware/boot.nix
      ./sys/hardware/power.nix
      ./sys/hardware/time.nix
      ./sys/hardware/bluetooth.nix
      ./sys/greetd.nix
      ./sys/gc.nix
      ./sys/console.nix

      # Basic wm settings
      ./sys/wm/hyprland.nix
      ./sys/wm/fonts.nix
      ./sys/wm/pipewire.nix
    ];

    # Enable flakes
    nix.package = pkgs.nixFlakes;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    nixpkgs.config.allowUnfree = true;

    networking.hostName = sysconfig.hostname;

    time.timeZone = sysconfig.timezone;
    i18n.defaultLocale = sysconfig.locale;
    i18n.extraLocaleSettings = {
      LC_ADDRESS = sysconfig.locale;
      LC_IDENTIFICATION = sysconfig.locale;
      LC_MEASUREMENT = sysconfig.locale;
      LC_MONETARY = sysconfig.locale;
      LC_NAME = sysconfig.locale;
      LC_NUMERIC = sysconfig.locale;
      LC_PAPER = sysconfig.locale;
      LC_TELEPHONE = sysconfig.locale;
      LC_TIME = sysconfig.locale;
    };

    # Configure default user
    users.users.${userconfig.username} = {
      isNormalUser = true;
      description = userconfig.name;
      extraGroups = [ "networkmanager" "wheel" "input" ];
      packages = [];
    };

    # Don't touch - first release used for compatibility
    system.stateVersion = "23.11";
    
}
