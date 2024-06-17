{ ... }:

{
  networking.networkmanager.enable = true;

  # Using iwd for 802.1x connections, wpa_supplicant may work
  networking.networkmanager.wifi.backend = "iwd";
  # Disable randomised mac addresses
  networking.networkmanager.settings = {
    device."wifi.scan-rand-mac-address" = "no";
    connection."wifi.cloned-mac-address" = "permanent";
  };

  networking.firewall.enable = true;
}

