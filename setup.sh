#! /usr/bin/env bash

# Ensure we're working from this directory
cd $(dirname $0)

# The link function will append this to any files that already
# exist in order to preserve them
backup_suffix='.dotfile_backup'

# Link a file from this repository into the users home directory
# backups of existing files will be made with a siffix of $backup_suffix
# $1 The source file, relative to the 'files' directory
# $2 The destination file, relative to $HOME
function link() {
    src="$PWD/files/$1"
    dst="$HOME/$2"

    ln --symbolic --backup --suffix "$backup_suffix" "$src" "$dst"
}

# Start linking files

link bash/.bashrc .bashrc


echo "Done!"
echo "Any existing files have been renamed with a suffix of '$backup_suffix'"
