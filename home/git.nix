{ userconfig, ... }:

{
  programs.git = {
    enable = true;
    userName = userconfig.name;
    userEmail = userconfig.email;
    extraConfig.init.defaultBranch = "main";
  };  
}
