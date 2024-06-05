set fish_greeting # Disable greeting
fastfetch

alias cl="clear"
alias lgit="lazygit"
alias cat="bat"
alias ls="ls --color=auto --group-directories-first"
alias vim="nvim"

starship init fish | source
zoxide init --cmd cd fish | source
direnv hook fish | source
