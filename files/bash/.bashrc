# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Alias'
alias ls='ls --color=always'
alias ll='ls -lh'

# Load local bash file for box specific configuration
[[ -f "$HOME/.bashrc_local" ]] && source "$HOME/.bashrc_local"

