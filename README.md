# dotfiles

## Setting up a new machine
1. `xcode-select --install`
1. `sh -c "$(curl -fsLS https://chezmoi.io/get)" -- -b $HOME/.local/bin`
1. `./local/bin/chezmoi init --apply https://github.com/benhinchley/dotfiles.git`

## Setting `fish` as default shell
1. `echo "/usr/local/bin/fish" >> /etc/shells`
1. `chsh -s /usr/local/bin/fish`
