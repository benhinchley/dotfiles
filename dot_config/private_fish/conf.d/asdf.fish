if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims


# ruby 2.x–3.0
set -gx RUBY_CONFIGURE_OPTS --with-openssl-dir=(brew --prefix openssl@1.1)

# ruby 3.1-above
# set -gx RUBY_CONFIGURE_OPTS --with-openssl-dir=(brew --prefix openssl@3)

# erlang
set -gx KERL_CONFIGURE_OPTIONS "--disable-debug --without-javac --with-ssl="(brew --prefix openssl@1.1)
