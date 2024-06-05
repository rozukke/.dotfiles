{ userconfig, ... }:

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        shell = "fish";

        font = userconfig.font + ":size=8";
        dpi-aware = "yes";
        pad = "5x3";
      };
      colors = {
        alpha = 0.8;
      };
      scrollback = {
        indicator-position = "fixed";
      };
    };
  };
}
