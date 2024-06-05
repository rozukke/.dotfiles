{ ... }:

{
  # NixOS builtin
  powerManagement.enable = true;
  # Overheating
  services.thermald.enable = true;
  # Stop wifi from turning off
  networking.networkmanager.wifi.powersave = false;
  # Power profiles - extra config accessible
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "balanced";
      turbo = "auto";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };
}
