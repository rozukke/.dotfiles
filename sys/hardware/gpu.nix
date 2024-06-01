{ pkgs, ... }:

{
  # Hardware accelerated decoding
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      libvdpau-va-gl
    ];
  };

  # Force intel media driver
  environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; };
}
