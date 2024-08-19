set fish_greeting # Disable greeting

alias cl="clear"
alias lgit="lazygit"
alias cat="bat"
alias ls="ls --color=auto --group-directories-first"
alias vim="nvim"

starship init fish | source
# Only show full prompt for current
enable_transience
zoxide init --cmd cd fish | source
direnv hook fish | source
