#!/bin/bash

## This script will install these dotfiles into your home directory,
## backing up the original files before it does so.
DOTFILES=( * )
DATE=$(date "+%Y-%m-%d_%H:%M")

for d in "${DOTFILES[@]}"; do

	if [[ "$d" != "README.md" && "$d" != "install.sh" ]]
	then
		echo Backing up "$HOME"/."$d" to "$HOME"/.dotfiles_$DATE.tar
		tar -rf "$HOME"/.dotfiles_$DATE.tar "$HOME"/."$d"
		echo Installing "$d" to "$HOME"/."$d"
		cp -R "$d" "$HOME"/."$d"
	fi

done

echo Compressing backups...
gzip "$HOME"/.dotfiles_$DATE.tar
echo Backups can be found at "$HOME"/.dotfiles_$DATE.tar.gz

echo \n\n Dotfiles are now installed in "$HOME"
