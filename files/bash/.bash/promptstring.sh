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

	# Manually keep track of the PS1 length
	length=0

	# Get background jobs
	if [[ $job_count -gt 0 ]]; then
		job_segment="${styles[black_yellow]} ${job_count} ${styles[reset]}"
		(( length += 2+${#job_count} ))
	fi

	# Determine if the current user is root
	identity_colour="blue"
	if [[ $UID -eq 0 ]]; then
		identity_colour="red"
	fi

	identity_segment="${styles[black_${identity_colour}]} ${user}@${host} ${styles[reset]}"
	(( length += 3+${#user}+${#host} ))

	cwd_segment="${styles[white_darkgrey]} ${current_directory} ${styles[reset]}"
	(( length += 2+${#current_directory} ))

	# Determine if the PS1 is too long and whether we should break it across
	# a couple of lines
	line_break=''
	if (( $(tput cols)-length < 25 )); then
		line_break='\n'
	fi

	prompt_segment="${styles[black_yellow]} ${styles[reset]}"

	# Build the Prompt
	echo -e "\n${exit_code_segment}${job_segment}${identity_segment}${cwd_segment}${line_break}${prompt_segment} "
}

# Builds PS2 and PS4
function build_PS2_PS4() {
	echo -e "${styles[black_yellow]} ${styles[reset]} "
}

# Builds PS3
function build_PS3() {
	echo -e "\n${styles[white_darkgrey]} Choose ${styles[black_yellow]} ${styles[reset]} "
}

