#!/bin/bash
# usage: ./create-symlinks.sh ~/code/dotfiles-2025 

# Check if the path argument was provided
if [ -z "$1" ]; then
    echo "Usage: $0 <path-to-dotfiles>"
    exit 1
fi

dotfiles=("vimrc" "bashrc" "gitconfig")
DOTFILES_DIR="$1"

for dotfile in "${dotfiles[@]}"; do
    # check if the dotfile already exists
    if [ -e ~/".$dotfile" ]; then
        # backup the existing dotfile
        backup_file=~/".$dotfile.bak_$(date +"%Y-%m-%d-%H-%M-%S")"
        mv ~/".$dotfile" "$backup_file"
        echo "backup of existing $dotfile created at $backup_file"
    fi

    ln -s "$DOTFILES_DIR/$dotfile" ~/.$dotfile
    echo "Symbolic link created for $dotfile"
done
