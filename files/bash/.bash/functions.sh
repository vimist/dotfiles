run_in_terminal() {
    TITLE="$1"
    shift

    alacritty --title "$TITLE" --command "$@"
}
