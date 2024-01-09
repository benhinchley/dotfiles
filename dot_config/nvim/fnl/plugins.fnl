(require-macros :hibiscus.packer)
(local {: setup} (require :nvim.pkg))

(packer-setup! {})

(packer!
  (use! :udayvir-singh/tangerine.nvim)
  (use! :udayvir-singh/hibiscus.nvim
        :requires [:udayvir-singh/tangerine.nvim])
  (use! :jaawerth/fennel.vim)

  (use! :lewis6991/impatient.nvim)

  ;; treesitter
  (use! :nvim-treesitter/nvim-treesitter
        :run ":TSUpdate")
  (use! :nvim-treesitter/nvim-treesitter-context)

  (use! :fenetikm/falcon)
  (use! :rcarriga/nvim-notify)
  (use! :nvim-lualine/lualine.nvim)
  (use! :kevinhwang91/nvim-ufo
        :requires [:kevinhwang91/promise-async])

  (use! :numToStr/Comment.nvim)
  (use! :kylechui/nvim-surround)
  (use! :ojroques/nvim-osc52)
  (use! :monkoose/matchparen.nvim)
  (use! :cappyzawa/trim.nvim)

  (use! :tpope/vim-eunuch)
  (use! :tpope/vim-vinegar)
  (use! :tpope/vim-unimpaired)

  ;; git
  (use! :tpope/vim-fugitive)

  ;; lsp
  (use! :neovim/nvim-lspconfig
        :requires [:williamboman/mason.nvim
                   :williamboman/mason-lspconfig.nvim])
  (use! :folke/trouble.nvim)
  (use! :SmiteshP/nvim-navic)

  ;; telescope
  (use! :nvim-telescope/telescope.nvim
        :requires [:nvim-lua/plenary.nvim])
  (use! :nvim-telescope/telescope-fzf-native.nvim
        :run :make)
  (use :ahmedkhalf/project.nvim)

  ;; completion + snippets
  (use! :hrsh7th/nvim-cmp
        :requires [:hrsh7th/cmp-buffer
                   :hrsh7th/cmp-path
                   :hrsh7th/cmp-nvim-lsp
                   :saadparwaiz1/cmp_luasnip])
  (use! :L3MON4D3/LuaSnip
        :requires [:rafamadriz/friendly-snippets]))
