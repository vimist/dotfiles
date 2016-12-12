# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load in dependencies
source "$HOME/.bash/promptstring.sh"

# Prompt strings
PS0='\n'
PS1='$(build_PS1 "\u" "\h" "\w" "\j" "$?" "\#")'

# Alias'
alias ls='ls --color=always'
alias ll='ls -lh'

# Load local bash file for box specific configuration
[[ -f "$HOME/.bashrc_local" ]] && source "$HOME/.bashrc_local"

