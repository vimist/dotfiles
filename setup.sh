#! /bin/sh

# Ensure we're working from this directory
cd "$(dirname $0)"

# Output colours
error() { tput setaf 1; echo "$@"; tput sgr0; }
warn() { tput setaf 3; echo "$@"; tput sgr0; }
success() { tput setaf 2; echo "$@"; tput sgr0; }

# Link a file from $1 to $2 with some nice checks
# $1 The source file, relative to the current directory
# $2 The destination file
#    If unspecified, the basename of the current directory will be appended to
#    "$HOME" and the file will be linked there.
#    If the destination is specified then it will be used.
link() {
    default_dst="$HOME/$1"

    src="$PWD/$1"
    dst="${2:-$default_dst}"

    # Check source exists
    if [[ ! -e "$src" ]]; then
        error "Source file '$src' does not exist"
        return
    fi

    mkdir -p "$(dirname "$dst")"

    # If the destination exists
    if [[ -e "$dst" || -L "$dst" ]]; then
        warn -n "Removing existing file '$dst'... "
        if rm "$dst"; then
            success Done
        else
            error Failed
            return
        fi
    fi

    if ln --symbolic "$src" "$dst"; then
        success "Installed '$src'"
    else
        error "Could not symlink '$src'"
    fi
}

# Redirect the output so we don't clutter the screen
pushd() { command pushd "$1" > /dev/null; }
popd() { command popd > /dev/null; }


# Start linking files

# Bash
pushd files/bash
link .bashrc "$HOME/.bashrc"
link .bash/styles.sh
link .bash/promptcommand.sh
link .bash/promptstring.sh
link .bash/functions.sh
popd

# Vim
pushd files/vim
link .vimrc "$HOME/.vimrc"
link .vim/ftplugin/php.vim
link .vim/ftplugin/yaml.vim
link .vim/ftplugin/markdown.vim
link .vim/ftplugin/tex.vim
link .vim/ftplugin/plaintex.vim
link .vim/plugins.vim
link .vim/pluginsettings.vim
link .vim/keybindings.vim
link .vim/statusline.vim

# Create special directories
for dir in "$HOME/.vim/backup_files" "$HOME/.vim/swap_files"; do
    if [[ -d "$dir" ]]; then
        warn -n "Removing existing directory '$dir'... "
        rm -Rf "$dir" && success Done || error Failed
    fi

    mkdir -p "$dir"
done

plug_path="$HOME/.vim/plug"
if [[ -d "$plug_path" ]]; then
    warn -n "Removing existing vim plugins... "
    rm -Rf "$plug_path" && success Done || error Failed
fi

# Bootstrap Plug plugin manager
if curl --silent --create-dirs -Lo "$HOME/.vim/autoload/plug.vim" \
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
then
    success "Installed Plug"
    vim -c 'PlugClean!' -c 'PlugInstall' -c 'quitall'
    echo "Installed vim plugins"
else
    error "Could not install Plug"
fi
popd

# Tmux
pushd files/tmux
link .tmux.conf "$HOME/.tmux.conf"
link .tmux/keybindings.conf
link .tmux/theme.conf
popd

# Git
pushd files/git
link .gitconfig "$HOME/.gitconfig"
popd

# GDB
pushd files/gdb
link .gdbinit "$HOME/.gdbinit"
popd

echo
echo "Done!"
