{ pkgs, ... }:

# Please not that these are NOT ALL packages provided by
# home-manager - some are enabled in other .nix files.
{
  home.packages = (with pkgs; [
    neovim
    # Info
    fastfetch
    btop
    # Tools
    bat
    feh
    brightnessctl # Screen brightness
    pw-volume # Volume control
    killall
    ripgrep
    lazygit
    # Shell
    fish
    zoxide
    fzf
    starship
  ]);

}
