{ pkgs, ... }:

# Please not that these are NOT ALL packages provided by
# home-manager - some are enabled in other .nix files.
{
  home.packages = (with pkgs; [
    neovim
    fastfetch
    ripgrep
    btop
    bat
    brightnessctl # Screen brightness
    pw-volume # Volume control
    killall
    cargo
    rustc
  ]);

}
