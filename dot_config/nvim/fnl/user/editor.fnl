(require-macros :hibiscus.vim)
(local {: setup} (require :nvim.pkg))

(set! number true)
(set! relativenumber true)
(set! cursorline true)

(set! splitright true)
(set! splitbelow true)

(set! colorcolumn "80,120")
(set! signcolumn "yes")

(set! scrolloff 10)
(set! cmdheight 2)

(set! expandtab true)
(set! tabstop 4)
(set! shiftwidth 4)
(set! softtabstop 4)
(set! smartindent true)

(set! undodir (.. (vim.fn.stdpath "data") "/undodir"))
(set! undofile true)

(set! ignorecase true)
(set! smartcase true)

(set! foldcolumn :1)
(set! foldlevel 99)
(set! foldlevelstart 99)
(set! foldenable true)

(setup :nvim-treesitter.configs
       {:ensure_installed [:lua :fennel
                           :go :gomod :gowork :proto :yaml
                           :python :sql
                           :javascript :typescript :json
                           :rust]})
(setup :treesitter-context)

(setup :ufo {:provider_selector (fn [bufnr filetype buftype]
                                    [:treesitter :indent])})
(setup :matchparen)
(setup :trim)
