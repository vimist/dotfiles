# Associative array to contain text style codes
declare -A styles

# Manually cache the colours and styles
styles[reset]="\x01$(tput sgr0)\x02"

styles[red_black]="\x01$(tput setaf 1)$(tput setab 0)\x02"
styles[black_yellow]="\x01$(tput setaf 0)$(tput setab 3)\x02"
styles[black_blue]="\x01$(tput setaf 0)$(tput setab 4)\x02"
styles[black_red]="\x01$(tput setaf 0)$(tput setab 1)\x02"
styles[white_darkgrey]="\x01$(tput setaf 7)$(tput setab 234)\x02"
