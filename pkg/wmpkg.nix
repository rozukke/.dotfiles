# Packages that are specific to the window manager
{ pkgs, ... }:

{
  # Warning - changes might need to be propagated to hyprland.conf
  home.packages = (with pkgs; [
    foot # Terminal
    firefox
    shared-mime-info
    xdg-utils
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    waybar
    dunst
    rofi-wayland # Program search
    wl-clipboard # Clipboard support
    grim slurp
    hyprpaper # Wallpaper
    hyprcursor
    hypridle
    hyprlock
    hyprcursor
    discord
    vscodium
  ]);
}
