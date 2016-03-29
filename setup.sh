#!/bin/bash

#('-.    .-')
#_(  OO)  ( OO ).
#,------.,-.-')  ,--.     (,------.(_)---\_)
#('-| _.---'|  |OO) |  |.-')  |  .---'/    _ |
#(OO|(_\    |  |  \ |  | OO ) |  |    \  :` `.
#/  |  '--. |  |(_/ |  |`-' |(|  '--.  '..`''.)
#\_)|  .--',|  |_.'(|  '---.' |  .--' .-._)   \
    #.-.\|  |_)(_|  |    |      |  |  `---.\       /
#`-' `--'    `--'    `------'  `------' `-----'
#
# Author: Benjamin Hinchley
# License: WTFPL


black='\033[0;30m'
white='\033[0;37m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'

alias Reset="tput sgr0"

cecho() {
    echo "${2}${1}"
    Reset
    return
}

err() {
    cecho "${1}" $red
}

details() {
    echo ""
    cecho "                                ('-.    .-')    " $blue
    cecho "                              _(  OO)  ( OO ).  " $blue
    cecho "    ,------.,-.-')  ,--.     (,------.(_)---\_) " $blue
    cecho " ('-| _.---'|  |OO) |  |.-')  |  .---'/    _ |  " $blue
    cecho " (OO|(_\    |  |  \ |  | OO ) |  |    \  :\` \`.  " $blue
    cecho " /  |  '--. |  |(_/ |  |\`-' |(|  '--.  '..\`''.) " $blue
    cecho " \_)|  .--',|  |_.'(|  '---.' |  .--' .-._)   \ " $blue
    cecho ".-.\|  |_)(_|  |    |      |  |  \`---.\       / " $blue
    cecho "\`-' \`--'    \`--'    \`------'  \`------' \`-----'  " $blue
    echo ""
    cecho "Author: \tBenjamin Hinchley" $white
    cecho "License: \tWTFPL" $white
    echo ""
}

details
cecho "Setting up dotifles on $HOSTNAME" $green

echo ""
cecho "Checking what platform your on." $blue
if [[ $OSTYPE == *"darwin"* ]]
then
    OS="OSX"
else
    OS="IDK"
fi

echo "It looks like your running ${OS}"
echo ""

cecho "Gaining sudo permissions" $red

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo ""
cecho "Checking what needs to happen." $blue

if [[ $OS == "OSX" ]]
then
    [ -d /usr/local/Cellar ] || {
	cecho "Installing homebrew and brews" $green
	pushd ${HOME}
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

	brew install bash vim git tmux z
	echo /usr/local/bin/bash >> /etc/shells
	chsh -s /usr/local/bin/bash

	brew tap caskroom/cask
	brew cask install iterm2 caffeine spectacle tower alfred flux kaleidoscope google-chrome
	popd
    }
fi

if [ -f "${HOME}/.bash_profile" ] || [ -h "${HOME}/.bash_profile" ]; then
    cecho "Found ~/.bash_profile, backing up to ~/.bash_profile.old" $green
    mv ~/.bash_profile ~/.bash_profile.old
    cecho "symlinking .bash_profile" $green
    ln -sf ~/dotfiles/bash/bash_profile ~/.bash_profile
fi

if [ -f "${HOME}/.bashrc" ] || [ -h "${HOME}/.bashrc" ]; then
    cecho "Found ~/.bashrc, backing up to ~/.bashrc.old" $green
    mv ~/.bashrc ~/.bashrc.old
    cecho "symlinking .bashrc" $green
    ln -sf ~/dotfiles/bash/bashrc ~/.bashrc
fi

[ -d ${HOME}/.vim ] || {
    cecho "Installing vim-plug" $green
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

[ -f ${HOME}/.vimrc ] || {
    cecho "Symlinking vimrc and overwriting if already exits" $green
    ln -sf ~/dotfiles/vimrc ~/.vimrc
}

cecho "Setting up dev environment" $green
[ -d ${HOME}/Repositories ] || ( mkdir -p ${HOME}/Repositories )
[ -d ${HOME}/Projects ] || ( mkdir -p ${HOME}/Projects )

echo ""
cecho "Everything is all good to go." $green
