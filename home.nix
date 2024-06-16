{  config, pkgs, userconfig, ... }:

{
  # Info about paths to manage
  home.username = userconfig.username;
  home.homeDirectory = "/home/" + userconfig.username;

  programs.home-manager.enable = true;

  # All user apps imported
  imports = [
    # Package imports
    ./pkg/wmpkg.nix
    ./pkg/clipkg.nix
    ./pkg/devpkg.nix

    # App configs
    ./home/git.nix
    ./home/foot.nix

    # Shell config
    ./shell/direnv.nix
  ];

  home.sessionVariables = {
    EDITOR = userconfig.editor;
    SPAWNEDITOR = userconfig.spawnEditor;
    TERM = userconfig.term;
    BROWSER = userconfig.browser;
  };

  # Override for cursor theming
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.quintom-cursor-theme;
    name = "Quintom_Snow";
    size = 36;
  };

  # I believe this is required for IPC
  xdg = {
    enable = true;
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "x-scheme-handler/http" = ["firefox.desktop"];
        "x-scheme-handler/https" = "firefox.desktop";
      };
    };
  };
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = "hyprland";
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    music = "${config.home.homeDirectory}/media/music";
    pictures = "${config.home.homeDirectory}/media/pictures";
    download = "${config.home.homeDirectory}/downloads";
    documents = "${config.home.homeDirectory}/documents";
    templates = null;
    videos = null;
    desktop = null;
    publicShare = null;
  };

  news.display = "silent";

  # Do not touch - original version for compatibility
  home.stateVersion = "23.11";
}
