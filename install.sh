#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `install.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

if test ! $(which zsh); then
	printf "\n\e[1mInstalling zsh...\e[0m\n\n"
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

printf "\n\e[1mLinking dotfiles...\e[0m\n\n"

ln -si $BASEDIR/.zshrc ~/.zshrc
ln -si $BASEDIR/.zfunctions.sh ~/.zfunctions
ln -si $BASEDIR/.zaliases.sh ~/.zaliases
ln -si $BASEDIR/john.zsh-theme $HOME/.oh-my-zsh/themes/john.zsh-theme
ln -si $BASEDIR/.vimrc ~/.vimrc
ln -si $BASEDIR/.tmux.conf ~/.tmux.conf
ln -si $BASEDIR/.gitconfig ~/.gitconfig

printf "\n\e[1mInstalling packages...\e[0m\n\n"

curl -L https://raw.githubusercontent.com/kamranahmedse/git-standup/master/installer.sh | sudo sh
curl -L https://raw.githubusercontent.com/johnsylvain/git-cleanup/master/installer.sh | sudo sh

if test ! $(which brew); then
	echo "Installing homebrew..."
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade --all

# Install packages
brew install hub
brew install tmux
brew install zsh-syntax-highlighting
brew install jq
brew install yarn

# Install casks
brew cask install --appdir="/Applications" visual-studio-code
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" spotify

brew cleanup

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

curl -s "https://get.sdkman.io" | bash

printf "\n\e[1mSetting system defaults...\e[0m\n\n"

# Finder sidebar size
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

# Tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Dock settings
defaults write com.apple.dock tilesize -int 36
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide -bool true

for app in "Dock" "Finder"; do
	killall "${app}" > /dev/null 2>&1
done

printf "\n\e[1mDone.\e[0m\n"
echo "Note that some of these changes require a logout/restart of your OS to take effect.  At a minimum, be sure to restart your Terminal."
