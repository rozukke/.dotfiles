{ config, ... }:

{
  # Boot options for silent boot
  boot = {
    loader = {
      systemd-boot.editor = false;
    };

    consoleLogLevel = 0;
    kernelParams = [
      "quiet"
      "splash"
      "vga=current"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
    initrd.verbose = false;
    plymouth.enable = true;
  };
}
