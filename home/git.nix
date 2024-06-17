{ userconfig, ... }:

{
  programs.git = {
    enable = true;
    userName = userconfig.name;
    userEmail = userconfig.email;
    extraConfig.init.defaultBranch = "main";
    aliases = {
      co = "checkout";
      cmt = "commit";
    };
    extraConfig = {
      url = {
        "git@github.com:" = {
          insteadOf = [
            "gh:"
            "github:"
            "https://github.com/"
          ];
        };
      };
    };
  };
}
