{ pkgs, ... }:

{
  # List of system essential packages
  environment.systemPackages = with pkgs; [
     vim
     curl wget
     zip unzip
     git
     fd
     gcc
     gnumake
     home-manager
     linuxPackages_latest.perf
     linux-wifi-hotspot
    ];
}
