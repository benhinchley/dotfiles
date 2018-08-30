#!/usr/bin/env bash

set -eo pipefail

echo "installing dotfiles"
if [ ! -d "$HOME/.dotfiles" ]; then
    git clone https://github.com/benhinchley/dotfiles.git ~/.dotfiles
fi

pushd ~/.dotfiles > /dev/null
if [ "$(uname -s)" == "Darwin" ]; then
    source osx/macos
    source osx/homebrew
fi

source bash/install.bash
source git/install.bash
source vim/install.bash
popd > /dev/null

echo "it's probably a good idea to restart your system now"