# Display the exit code of the previously exited command
function echo_exit_status() {
	exit_code=$?

	# Don't show the exit code if it was successful, a job was suspended
	# or the shell has just been launched ($SECONDS == 0)
	if [[ $exit_code -eq 0 || $exit_code -eq 148 || $SECONDS -eq 0 ]]; then
		return
	fi

	exit_code_file="/usr/include/asm/signal.h"

	signal_number=$(( $exit_code - 128 ))

	signal=$(
		grep -P "^#define\s+SIG[A-Z]{1,10}\d{0,2}\s+$signal_number\$" \
		"$exit_code_file")

	signal=${signal#* }
	signal=${signal%% *}
	signal=${signal%%	*}

	if [[ -z $signal ]]; then
		echo -e "\n${styles[red_black]}Exited with code${styles[reset]} ${exit_code}"
	else
		echo -e "\n${styles[red_black]}Exited with${styles[reset]} ${signal} (${exit_code})"
	fi
}

function prompt_command() {
	echo_exit_status
}
