{ pkgs, ... }:

{

  fonts.packages = with pkgs; [
    # Chinese/Japanese support
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    # Basic fonts
    ubuntu_font_family
    # Main font
    jetbrains-mono

    # Nerd fonts and symbols - have to use unpatched
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; }) # this is *still* not enough to fix alignment.
  ];

}
