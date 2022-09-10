#!/usr/bin/env bash

if hash "brew"; then
	exit 0
fi

NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
