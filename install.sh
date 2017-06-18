#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ZSH=(
	"ln -si ${BASEDIR}/.zshrc ~/.zshrc"
	"ln -si ${BASEDIR}/john.zsh-theme $HOME/.oh-my-zsh/themes/john.zsh-theme"
)

GIT=(
	"ln -si ${BASEDIR}/.gitconfig ~/.gitconfig"
)

ALL_FILES=("git" "zsh")

install_files() {
	printf "\n\e[1mInstalling $1 dotfiles...\e[0m\n\n"
	if [ "$1" == "git" ]; then
		for i in "${GIT[@]}"; do
			echo "exec: $i"
			eval $i
		done
	elif [ "$1" == "zsh" ]; then
		for i in "${ZSH[@]}"; do
			echo "exec: $i"
			eval $i
		done
	else
		echo "not found: $1"
	fi		
}

install_all() {
	printf "\n\e[1mInstalling all dotfiles...\e[0m\n"
	for f in "${ALL_FILES[@]}"; do
		install_files $f
	done
}

if [ -z "$1" ];
	then
		install_all
	else
		install_files $1
fi

