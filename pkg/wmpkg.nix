# Packages that are specific to the window manager
{ pkgs, ... }:

{
  # Warning - changes might need to be propagated to hyprland.conf
  home.packages = (with pkgs; [
    foot # Terminal
    firefox 
    waybar
    rofi-wayland # Program search
    wl-clipboard # Clipboard support
    hyprpaper # Wallpaper
    discord
  ]);
}
