{
  security = {
    # Allow hyprlock to unlock the screen
    pam.services.hyprlock.text = "auth include login";

    # Don't require password to run sudo
    sudo.wheelNeedsPassword = false;
  }
}
