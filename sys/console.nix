{ pkgs, ... }:

# Low-level console config
{

  # Console font config
  console = {
    earlySetup = true;
    packages = with pkgs; [
      terminus_font
    ];
    font = "ter-v32n";
  };

}
