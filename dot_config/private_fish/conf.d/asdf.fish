source (brew --prefix asdf)/libexec/asdf.fish

# ruby 2.x–3.0
set -gx RUBY_CONFIGURE_OPTS --with-openssl-dir=(brew --prefix openssl@1.1)

# ruby 3.1-above
# set -gx RUBY_CONFIGURE_OPTS --with-openssl-dir=(brew --prefix openssl@3)

# erlang
set -gx KERL_CONFIGURE_OPTIONS "--disable-debug --without-javac --with-ssl="(brew --prefix openssl@1.1)
