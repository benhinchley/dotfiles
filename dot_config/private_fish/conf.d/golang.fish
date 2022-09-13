set -gx GOPATH $HOME/.local/share/go
fish_add_path (go env GOPATH)/bin
fish_add_path (go env GOROOT)/bin
