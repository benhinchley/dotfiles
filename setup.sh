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

fresh() {
    sleep 5
    sudo shutdown -r now "Rebooting Now"
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


[ -d ${HOME}/.oh-my-zsh ] || {
cecho "Installing Oh-my-Zsh" $green
pushd ${HOME}
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
popd
}

[ -f ${HOME}/.oh-my-zsh/custom/aliases.zsh ] || {
cecho "Symlinking aliases and functions" $green
ln -s ~/dotfiles/.aliases ~/.oh-my-zsh/custom/aliases.zsh
ln -s ~/dotfiles/.functions ~/.oh-my-zsh/custom/functions.zsh
}

[ -d ${HOME}/.vim ] || {
cecho "Installing vim-plug" $green
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

[ -f ${HOME}/.vimrc ] || {
cecho "Symlinking vimrc and overwriting if already exits" $green
ln -sf ~/dotfiles/vimrc ~/.vimrc
}


if [[ $OS == "OSX" ]]
then
    cecho "Configuring OS X" $green
    pushd .
    #source .osx
    popd
    [ -d /usr/local/Cellar ] || {
	cecho "Installing homebrew and brews" $green
	pushd .
	source .homebrew
	popd
    }
fi

cecho "Setting up dev environment" $green
pushd ${HOME}
grep 'export GOPATH=' .zshrc || {
echo export GOPATH=${HOME}/Workspace | tee -a .zshrc
zsh -ic "source ${HOME}/.zshrc"
mkdir -p $GOPATH
}
popd

[ -d ${HOME}/Repositories ] || ( mkdir -p ${HOME}/Repositories )
[ -d ${HOME}/Projects ] || ( mkdir -p ${HOME}/Projects )

echo ""
cecho "Everything is all good to go." $green
