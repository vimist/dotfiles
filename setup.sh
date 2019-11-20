#! /usr/bin/env bash

# Ensure we're working from this directory
cd "$(dirname $0)"

# The link function will append this to any files that already
# exist in order to preserve them
backup_suffix='.dotfile_backup'

# Link a file from this repository into the users home directory
# backups of existing files will be made with a suffix of $backup_suffix
# $1 The source file, relative to the current directory
# $2 The destination file, relative to $HOME
#    $1 is used if $2 is not specified, this allows us to pass in a single
#    argument if $1 should be recreated under $HOME
function link() {
    src="$PWD/$1"
    dst="$HOME/${2:-$1}"

    mkdir -p "$(dirname "$dst")"

    # If the destination is a symlink
    if [[ -L "$dst" ]]; then
        rm "$dst"
        echo "Removed existing symlink '$dst'"
    fi

    ln --symbolic --backup --suffix "$backup_suffix" "$src" "$dst"
    echo "Installed '$dst'"
}

# Redirect the output so we don't clutter the screen
function pushd() {
    command pushd "$1" > /dev/null
}

# Redirect the output so we don't clutter the screen
function popd() {
    command popd > /dev/null
}

# Start linking files

# Bash
pushd files/bash
link .bashrc
link .bash/styles.sh
link .bash/promptcommand.sh
link .bash/promptstring.sh
popd

# Vim
pushd files/vim
link .vimrc
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
	if [[ -d $dir ]]; then
		rm -Rf "$dir"
		echo "Removed existing vim backup and swap file directories"
	fi

	mkdir -p "$dir"
done

plug_path="$HOME/.vim/plug"
if [[ -d "$plug_path" ]]; then
    rm -Rf "$plug_path"
    echo "Removed existing vim plugins"
fi

curl --create-dirs -Lo "$HOME/.vim/autoload/plug.vim" \
	"https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
echo "Installed Plug"

vim -c 'PlugClean!' -c 'PlugInstall' -c 'quitall'
echo "Installed vim plugins"
popd

# Tmux
pushd files/tmux
link .tmux.conf
link .tmux/keybindings.conf
link .tmux/theme.conf
popd

# Git
pushd files/git
link .gitconfig
popd

# GDB
pushd files/gdb
link .gdbinit
popd

echo
echo "Done!"
echo "Any existing files have been renamed with a suffix of '$backup_suffix'"
