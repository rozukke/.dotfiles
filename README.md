# NixOS Config - rozukke

> [!WARNING]  
> **THIS IS DEPRECATED** - NixOS was too much of a hassle for the upsides to win me over, and as such this config is no longer in use.

This is my config for a customised install of NixOS on UEFI, tested with a ThinkPad T480s.

## Structure
The root directory contains: 
 - `flake.nix` which is the entry point for the build, and contains global variables
 - `configuration.nix` which configures basic system settings and imports system packages 
 - `home.nix` which sets up a few userspace programs and imports cli & window manager packages
 - `links.sh` which is my temporary crude way of dotfile management using symlinks

The folders are as follows:

 - `sys` contains configuration for basic system functionality and is mainly used by `configuration.nix`.
 - `home` contains traditional "dotfile" configuration & user settings, and is mainly used by `home-manager` with `home.nix`.
 - `pkg` contains lists of package dependencies for both sections of the OS.
 - `.config` contains out-of-store files that are symlinked for easy and quick editing & reloads.

The easiest way to add a package is via the appropriate `.nix` file in the `pkg` folder.

## Installing
Clone this repo and fill `flake.nix` with your own info.
You may need to match your username to what you created during NixOS installation.

**IMPORTANT**
You might want to disable `fprint.nix` from being built in `configuration.nix`. It implements specific fingerprint drivers and I have no clue what it breaks if the hardware is not present. Also switch out the hardware flake and `sys/hardware_configuration.nix` for your own configuration.
Run `sudo nixos-rebuild switch --flake .` inside the cloned repo. Upon completion, run `home-manager switch --flake .` to configure userspace and download programs.
Finally, run `links.sh` to symlink dotfiles.

## Troubleshooting
### `command-not-found` broken
If `command-not-found` returns some text about `sqlite`, run `nix-channel --update`.

### Some features are missing
Yes.

### Icons are misaligned
It doesn't seem like there are any working font icon packages that work consistently.

## TODO
Reloading home-manager for css-level changes is a pain. 
I don't particularly care about Nix purity when it comes to home manager convenience. To improve the process, some future steps need to be made:
 [x] Do out-of-store symlinks for config files that are more likely to be hot-reloaded.
 [ ] Write a template based formatter, and have it process templates into a .config store that is then symlinked to the actual config locations.

 ALSO REQUIRED - Fixing some configuration and adding extra:
 - Hyprcursor and consistent cursor size management
 - Bluetooth support and management
 - Maybe some sort of nice topbar applet to connect to wifi and bluetooth devices
 - Fix boot errors and font. 
