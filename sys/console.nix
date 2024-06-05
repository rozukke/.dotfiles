{ pkgs, ... }:

# Low-level console config
{

  # Console font config
  console = {
    packages = with pkgs; [
      terminus_font
    ];
    font = "ter-v32n";
  };

}
