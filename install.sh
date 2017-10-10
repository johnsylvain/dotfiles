#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

FILES=(
	# ZSH
	"ln -si ${BASEDIR}/.zshrc ~/.zshrc"
	"ln -si ${BASEDIR}/john.zsh-theme $HOME/.oh-my-zsh/themes/john.zsh-theme"
	
	# Vim
	"ln -si ${BASEDIR}/.vimrc ~/.vimrc"
	
	# Git
	"ln -si ${BASEDIR}/.gitconfig ~/.gitconfig"
)


printf "\n\e[1mInstalling all dotfiles...\e[0m\n\n"
for f in "${FILES[@]}"; do
	echo "exec: $f"
	eval $f
done
