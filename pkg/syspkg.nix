{ pkgs, ... }:

{
  # List of system essential packages
  environment.systemPackages = with pkgs; [
     vim
     curl wget
     zip unzip
     git
     gcc
     gnumake
     home-manager
    ];
}
