(require-macros :hibiscus.vim)
(local {: setup} (require :nvim.pkg))

((. (require :luasnip.loaders.from_vscode) :lazy_load))

(set! completeopt "menu,menuone,noselect")

(local opts {})
(tset opts :sources [{:name :nvim_lsp}
                     {:name :luasnip}
                     {:name :buffer}
                     {:name :path}])

(let [{: lsp_expand} (require :luasnip)]
  (tset opts :snippet {:expand (fn [args] (lsp_expand args.body))}))

(let [{: mapping
       : ConfirmBehavior
       : visible
       : select_next_item
       : select_prev_item} (require :cmp)

      {: expand_or_jumpable
       : expand_or_jump
       : jumpable
       : jump } (require :luasnip)

      overrides {"<CR>" (mapping.confirm {:behaviour ConfirmBehavior.Replace
                                          :select false})
                 "<Tab>" (mapping (fn [fallback]
                                    (if (visible) (select_next_item)
                                      (expand_or_jumpable) (expand_or_jump)
                                      (fallback))) [:i :s])
                 "<S-Tab>" (mapping (fn [fallback]
                                      (if (visible) (select_prev_item)
                                        (jumpable -1) (jump -1)
                                        (fallback))) [:i :s])}]
  (tset opts :mapping (mapping.preset.insert overrides)))

(setup :cmp opts)
