#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# zsh
ln -si ${BASEDIR}/.zshrc ~/.zshrc
ln -si ${BASEDIR}/john.zsh-theme $HOME/.oh-my-zsh/themes/john.zsh-theme

# git
ln -si ${BASEDIR}/.gitconfig ~/.gitconfig
