# NixOS Config - rozukke

This is my config for a customised install of NixOS on UEFI, tested with a ThinkPad T480s.

## Structure
The root directory contains: 
 - `flake.nix` which is the entry point for the build, and contains global variables
 - `configuration.nix` which configures basic system settings and imports system packages 
 - `home.nix` which sets up dotfiles and imports cli & window manager packages

The folders are as follows:

 - `sys` contains configuration for basic system functionality and is mainly used by `configuration.nix`.
 - `home` contains traditional "dotfile" configuration & user settings, and is mainly used by `home-manager` with `home.nix`.
 - `pkg` contains lists of package dependencies for both sections of the OS.

The easiest way to add a package is via the appropriate `.nix` file in the `pkg` folder.

## Installing
Clone this repository and run `sudo nixos-rebuild switch --flake .` inside. Upon completion, run `home-manager switch --flake .` to configure userspace.

## Troubleshooting
### `command-not-found` broken
If `command-not-found` returns some text about `sqlite`, run `nix-channel --update`.

## TODO
Reloading home-manager for css-level changes is a pain. 
I don't particularly care about Nix purity when it comes to home manager convenience. To improve the process, some future steps need to be made:
 - Do out-of-store symlinks for config files that are more likely to be hot-reloaded.
 - Write a template based formatter in nix, and have it process templates into a .config store that is then symlinked to the actual config locations.

 Fix some configuration and add extra:
 - Hyprcursor and consistent cursor size management
