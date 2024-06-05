{ ... }:

# Enables Hyprland and related services. Specific options are handled via symlink.
{

  # Stores usernames, passwords, and keys
  services.gnome.gnome-keyring.enable = true;

  # IMPORTANT - XWayland and systemd support are enabled by default.
  programs.hyprland.enable = true;

  # Electron app compatibility
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
}
