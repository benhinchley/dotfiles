#!/usr/bin/env fish

set -l asdf_plugins (asdf plugin list)

if not contains nodejs $asdf_plugins
    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
end

if not contains python $asdf_plugins
    asdf plugin add python https://github.com/asdf-community/asdf-python.git
end

if not contains ruby $asdf_plugins
    asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
end
