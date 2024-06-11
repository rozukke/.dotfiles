{ ... }

{
  services.kanshi = {
    enable = true;
    systemdTarget = "hyprland-session.target";

    profiles = {
      undocked = {
        outputs = [
          {
            criteria = "eDP-1";
            scale = 1.5;
            status = "enable";
          }
        ];
      };

      external_connected = {
        outputs = [
          {

          }
        ];
      };
    };
  };
}
