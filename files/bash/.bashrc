# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load in dependencies
source "$HOME/.bash/promptstring.sh"

# Prompt strings
PS0='\n'
PS1='$(build_PS1 "\u" "\h" "\w" "\j" "$?" "\#")'
PS2="$(build_PS2_PS4)"
PS3="$(build_PS3)"
PS4="$(build_PS2_PS4)"

# Alias'
alias ls='ls --color=always'
alias ll='ls -lh'
alias tree='tree -C'

# Load local bash file for box specific configuration
[[ -f "$HOME/.bashrc_local" ]] && source "$HOME/.bashrc_local"

