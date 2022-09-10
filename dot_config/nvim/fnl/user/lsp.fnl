(require-macros :hibiscus.vim)
(local {: setup} (require :nvim.pkg))

(setup :trouble)
(map! [n] "<leader>xx" "<cmd>Trouble<cr>")

(fn on_attach [client bufnr]
  (let [nmap (lambda [keys func] (map! [n :buffer] keys func))
        {: rename
         : code_action
         : definition
         : references
         : implementation
         : declaration
         : type_definition
         : hover
         : signature_help} vim.lsp.buf
        navic (require :nvim-navic)]

    (navic.attach client bufnr)

    (nmap "<space>rn" rename)
    (nmap "<space>ca" code_action)

    (nmap "gd" definition)
    (nmap "gD" declaration)
    (nmap "<space>D" type_definition)

    (nmap "gr" references)
    (nmap "gi" implementation)

    (nmap "K" hover)
    (nmap "<C-k>" signature_help)

    ;; (when (client.supports_method "textDocument/formatting")
    ;;   (autocmd ["BufWritePre"] {:callback (lambda []
    ;;                                         (let [fmt (or vim.lsp.buf.format vim.lsp.buf.formatting)]
    ;;                                           (fmt {:bufnr bufnr})))
    ;;                             :buffer bufnr
    ;;                             :group (augroup "LSPFormatOnSave")}))
    ))

(fn lsp [name ?settings]
  (let [capabilities (vim.lsp.protocol.make_client_capabilities)]
    ((. (. (require :lspconfig) name) :setup) {:on_attach on_attach
                                               :capabilities capabilities
                                               :settings ?settings})))

(setup :mason)
(setup :mason-lspconfig {:automatic_installation true})

;; lsp server configurations
(lsp :gopls)
