function bh_go_install
    set -l tmpfile (mktemp)
    curl -fLo $tmpfile "https://go.dev/dl/go$go_version.darwin-amd64.tar.gz"
    tar -C (dirname $go_install_dir) -xzf $tmpfile
    rm -rf $tmpfile
end
