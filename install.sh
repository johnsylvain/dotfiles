#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

FILES=(
	# ZSH
	"ln -si ${BASEDIR}/.zshrc ~/.zshrc"
	"ln -si ${BASEDIR}/.zprofile ~/.zprofile"
	"ln -si ${BASEDIR}/john.zsh-theme $HOME/.oh-my-zsh/themes/john.zsh-theme"
	
	# Vim
	"ln -si ${BASEDIR}/.vimrc ~/.vimrc"

	# tmux
	"ln -si ${BASEDIR}/.tmux.conf ~/.tmux.conf"
	
	# Git
	"ln -si ${BASEDIR}/.gitconfig ~/.gitconfig"
)


printf "\n\e[1mLinking dotfiles...\e[0m\n\n"
for f in "${FILES[@]}"; do
	echo "exec: $f"
	eval $f
done

printf "\n\e[1mInstalling scripts...\e[0m\n\n"
curl -L https://raw.githubusercontent.com/kamranahmedse/git-standup/master/installer.sh | sudo sh
curl -L https://raw.githubusercontent.com/johnsylvain/git-cleanup/master/installer.sh | sudo sh

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install packages
brew install tmux
brew install thefuck
brew install zsh-syntax-highlighting

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

curl -s "https://get.sdkman.io" | bash
