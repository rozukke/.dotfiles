{ pkgs, ... }:

{
  # Boot options for silent boot
  boot = {
    loader = {
      systemd-boot.enable = true;
      systemd-boot.editor = false;
      efi.canTouchEfiVariables = true;
    };

    consoleLogLevel = 3;
    kernelParams = [
      "quiet"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
    ];

    initrd = {
      enable = true;
      systemd.enable = true;
      verbose = false;
    };

    plymouth = {
      enable = true;
    };
  };
}
