{ pkgs, ... }:

{

  fonts.packages = with pkgs; [
    # Chinese/Japanese support
    noto-fonts-cjk-sans
    # Basic fonts
    ubuntu_font_family
    # Main font
    jetbrains-mono

    # Nerd fonts and symbols - have to use unpatched
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; }) # this is *still* not enough to fix alignment.
#    (nerdfonts.override { fonts = [ "Inconsolata" ]; }) # this is *still* not enough to fix alignment.
  ];

}
