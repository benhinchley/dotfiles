#!/bin/sh

# Set the colours you can use
black='\033[0;30m'
white='\033[0;37m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'


#  Reset text attributes to normal + without clearing screen.
alias Reset="tput sgr0"

# Color-echo.
# arg $1 = message
# arg $2 = Color
cecho() {
  echo "${2}${1}"
  Reset # Reset to normal.
  return
}

echo ""
cecho "###############################################" $green
cecho "#      SETTING UP YOUR MAC FOR AWESOMENESS    #" $green
cecho "###############################################" $green
echo ""

# Here we go.. ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo ""
cecho "installing oh-my-zsh and symlinking aliases and functions" $green
echo ""

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ln -s ~/dotfiles/.aliases ~/.oh-my-zsh/custom/aliases.zsh
ln -s ~/dotfiles/.functions ~/.oh-my-zsh/custom/functions.zsh
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

echo ""
cecho "oh-my-zsh install done" $green
echo ""

echo ""
cecho "running .osx" $green
echo ""

source .osx

echo ""
cecho ".osx done" $green
echo ""

echo ""
cecho "installing homebrew, tooling and applications" $green
echo ""

source .homebrew

echo ""
cecho "homebrew installed" $green
echo ""

echo ""
cecho "making Repositories folder" $green
echo ""

mkdir Repositories

echo ""
cecho "repositories folder created" $green
echo ""

echo ""
cecho "###############################################" $green
cecho "#           YOUR MAC IS NOW AWESOME           #" $green
cecho "###############################################" $green
echo ""
