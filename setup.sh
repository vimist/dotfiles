#! /usr/bin/env bash

# Ensure we're working from this directory
cd $(dirname $0)

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
link .bash/promptstring.sh
popd

# Vim
pushd files/vim
link .vimrc .vimrc
link .vim/vundle.vim
link .vim/pluginsettings.vim
link .vim/keybindings.vim
link .vim/statusline.vim

vundle_path="$HOME/.vim/bundle/Vundle.vim"
if [[ -d "$vundle_path" ]]; then
    rm -Rf "$vundle_path"
    echo "Removed existing Vundle"
fi

git clone https://github.com/VundleVim/Vundle.vim.git "$vundle_path"
echo "Installed Vundle"

vim -c 'PluginClean!' -c 'PluginInstall' -c 'quitall'
echo "Installed Vundle plugins"
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

echo
echo "Done!"
echo "Any existing files have been renamed with a suffix of '$backup_suffix'"
