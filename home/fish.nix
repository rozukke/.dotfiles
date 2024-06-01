{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      fastfetch
      alias cat="bat"
      alias ls="ls --color=auto --group-directories-first"
      alias vim="nvim"
    '';
#    functions = {
#      ls="ls --color=auto --group-directories-first";
#    };
  };  

  # Shell prompt
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
}
