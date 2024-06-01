{ inputs, userconfig, ... }:

{
#  services.open-fprintd.enable = true;
#  services.python-validity.enable = true;

  services.fprintd.enable = true;
  services.fprintd.tod = {
    enable = true;

    # Register existing fingerprint file
    driver = inputs.nixos-06cb-009a-fingerprint-sensor.lib.libfprint-2-tod1-vfs0090-bingch { 
      calib-data-file = ./calib-data.bin; 
    };
  };

  # Sudo will ask for fingerprint
  security.pam.services.sudo.fprintAuth = true;
}
