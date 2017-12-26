#!/usr/bin/env bash

# link .bash_profile
ln -snf "$HOME/.dotfiles/bash/bash_profile" "$HOME/.bash_profile"
# link .bashrc
ln -snf "$HOME/.dotfiles/bash/bashrc" "$HOME/.bashrc"
