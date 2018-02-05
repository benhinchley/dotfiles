#!/usr/bin/env bash

set -eo pipefail

echo "installing dotfiles"
if [ ! -d "$HOME/.dotfiles" ]; then
    git clone https://github.com/benhinchley/dotfiles.git ~/.dotfiles
fi

pushd ~/.dotfiles > /dev/null
source osx/macos
source osx/homebrew  2> /dev/null
source bash/install.bash
source git/install.bash
source vim/install.bash
popd > /dev/null

echo "it's probably a good idea to restart your system now"