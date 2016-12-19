# Associative array to contain text style codes
declare -A styles

# Manually cache the colours and styles
styles[reset]="\x01$(tput sgr0)\x02"

styles[red_black]="\x01$(tput setaf 1)$(tput setab 0)\x02"
styles[black_yellow]="\x01$(tput setaf 0)$(tput setab 3)\x02"
styles[black_blue]="\x01$(tput setaf 0)$(tput setab 4)\x02"
styles[black_red]="\x01$(tput setaf 0)$(tput setab 1)\x02"
styles[white_darkgrey]="\x01$(tput setaf 7)$(tput setab 234)\x02"

# Build PS1
# $1 The user
# $2 The hostname
# $3 The current directory
# $4 The number of background jobs
# $5 The last commands exit code
# $6 The number of this command
function build_PS1() {
    user=$1
    host=$2
    current_directory=$3
    job_count=$4
    exit_code=$5
    command_number=$6

    # Display the exit code if there was an error (not suspended)
    # and if wasn't before the first command was run
    if [[ $exit_code -gt 0 && $exit_code -ne 148 && $command_number -gt 1 ]]; then
        exit_code_segment="${styles[red_black]}Exited with code${styles[reset]} ${exit_code}\n\n"
    fi

    # Get background jobs
    if [[ $job_count -gt 0 ]]; then
        job_segment="${styles[black_yellow]} ${job_count} ${styles[reset]}"
    fi

    # Determine if the current user is root
    identity_colour="blue"
    if [[ $UID -eq 0 ]]; then
        identity_colour="red"
    fi

    identity_segment="${styles[black_${identity_colour}]} ${user}@${host} ${styles[reset]}"

    cwd_segment="${styles[white_darkgrey]} ${current_directory} ${styles[reset]}"

    prompt_segment="${styles[black_yellow]} ${styles[reset]}"

    echo -e "\n${exit_code_segment}${job_segment}${identity_segment}${cwd_segment}${prompt_segment} "
}

# Builds PS2 and PS4
function build_PS2_PS4() {
	echo -e "${styles[white_darkgrey]} ${styles[black_yellow]} ${styles[reset]} "
}

# Builds PS3
function build_PS3() {
	echo -e "\n${styles[white_darkgrey]} ? ${styles[black_yellow]} ${styles[reset]} "
}

