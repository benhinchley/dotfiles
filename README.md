# dotfiles

## Setting up a new machine
1. `xcode-select --install`
2. `sh -c "$(curl -fsLS https://chezmoi.io/get)" -- -b $HOME/.local/bin`
3. `./local/bin/chezmoi init --apply https://github.com/benhinchley/dotfiles.git`
