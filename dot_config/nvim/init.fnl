(require-macros :hibiscus.vim)
(local {: setup} (require :nvim.pkg))

(let [python3 (: (vim.fn.system "which python3") :gsub "%s+" "")]
  (g! python3_host_prog python3))

(g! loaded_ruby_provider 0)
(g! loaded_node_provider 0)
(g! loaded_perl_provider 0)

(require :plugins)

(set! termguicolors true)
(exec [[:colorscheme "falcon"]])

;; stop the mouse
(set! mouse nil)

(let [navic (require :nvim-navic)
      comp (fn [mode ?opts] (vim.tbl_extend :keep {1 mode} (or ?opts {})))]
  (setup :lualine
         {:options {:icons_enabled false
                    :component_separators ""
                    :section_separators ""}
          :sections {:lualine_c [(comp :filename {:path 1})
                                 (comp navic.get_location {:cond navic.is_available})]}}))

(require :user.kbd)
(require :user.editor)
(require :user.cmp)
(require :user.telescope)
(require :user.lsp)
(require :user.notifications)
