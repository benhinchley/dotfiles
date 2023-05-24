(require-macros :hibiscus.vim)
(local {: setup} (require :nvim.pkg))

(let [opts {:defaults {:prompt_prefix " "
                       :selection_caret " "
                       :entry_prefix " "
                       :path_display [:truncate]
                       :windblend 0
                       :border []
                       :vimgrep_arguments ["rg"
                                           "--color=never"
                                           "--no-heading"
                                           "--with-filename"
                                           "--line-number"
                                           "--column"
                                           "--smart-case"]
                       :set_env { "COLORTERM" "truecolor" }
                       :layout_strategy :horizontal
                       :layout_config {:width 0.85
                                       :height 0.8
                                       :preview_cutoff 120
                                       :horizontal {:prompt_position :top
                                                    :preview_width 0.55
                                                    :results_width 0.8}}}}]
  (setup :telescope opts))

(let [exts [:fzf :projects :notify]]
  (each [_ ext (ipairs exts)]
    ((. (require :telescope) :load_extension) ext)))

(setup :project_nvim)

(let [{: oldfiles
       : buffers
       : current_buffer_fuzzy_find
       : find_files
       : git_files
       : live_grep
       : help_tags
       : diagnostics} (require :telescope.builtin)
      {: get_dropdown} (require :telescope.themes)]
  (map! [n] "<leader>?" oldfiles)
  (map! [n] "<leader><space>" buffers)
  (map! [n] "<leader>/"
        #(current_buffer_fuzzy_find (get_dropdown {:winblend 10
                                                   :previewer false})))

  (map! [n] "<leader>sf" find_files)
  (map! [n] "<C-p>" git_files)
  (map! [n] "<leader>sg" live_grep)
  (map! [n] "<leader>sh" help_tags)
  (map! [n] "<leader>sd" diagnostics)
  (map! [n] "<leader>sp" "<cmd>Telescope projects<cr>"))
