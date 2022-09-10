#!/usr/bin/env fish

if not set --query go_version
    set --global go_version 1.19.1
end

if not set --query go_install_dir
    set --global go_install_dir $HOME/.local/go
end

fish_add_path $go_install_dir/bin

set -gx GOPATH $HOME/.local/share/go
fish_add_path (go env GOPATH)/bin
fish_add_path (go env GOROOT)/bin
