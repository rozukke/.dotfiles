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
     direnv
    ];
}
