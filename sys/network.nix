{ ... }:

{
    # This part is actually ok.
    networking.networkmanager.enable = true;

    networking.networkmanager.wifi.backend = "iwd";
    networking.networkmanager.settings = {
      device."wifi.scan-rand-mac-address" = "no";
      connection."wifi.cloned-mac-address" = "permanent";
    };

    networking.firewall.enable = true;
}

