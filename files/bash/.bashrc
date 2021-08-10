# Environment
export EDITOR=vim
export PAGER=less
export BROWSER=firefox
export PATH="$PATH:$HOME/bin"  # Add users bin to PATH


# Quit here if not running interactively

[[ $- != *i* ]] && return

# Load in dependencies
source "$HOME/.bash/styles.sh"
source "$HOME/.bash/promptstring.sh"
source "$HOME/.bash/promptcommand.sh"
source "$HOME/.bash/functions.sh"

# Prompt strings
PS0='\n'
PS1='$(build_PS1 "\u" "\h" "\w" "\j" "$?" "\#")'
PS2="$(build_PS2_PS4)"
PS3="$(build_PS3)"
PS4="$(build_PS2_PS4)"

PROMPT_COMMAND="prompt_command"

PROMPT_DIRTRIM=4
HISTCONTROL=ignorespace:erasedups
HISTFILESIZE=20480

shopt -s histappend

# Alias'
alias ls='ls --color=always'
alias ll='ls -lh'
alias tree='tree -C'
alias grep='grep --color'
alias less='less -R'
alias xxd='xxd -g1'

# Load local bash file for box specific configuration
[[ -f "$HOME/.bashrc_local" ]] && source "$HOME/.bashrc_local"
