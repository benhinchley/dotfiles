(require-macros :hibiscus.vim)
(local {: setup} (require :nvim.pkg))

;; set leader
(map! [n] "<space>" "<nop>")
(g! mapleader " ")
(g! maplocalleader " ")

;; swap ; and :
(map! [n] ";" ":")
(map! [n] ":" ";")

;; make start/end of line movements a bit saner
(map! [n] "H" "^")
(map! [n] "L" "$")

;; navigate lines visually
(map! [nv :expr] :j '(if (> vim.v.count 0) "j" "gj"))
(map! [nv :expr] :k '(if (> vim.v.count 0) "k" "gk"))

(setup :Comment)
(setup :nvim-surround)

(map! [v] "<leader>c" (. (require :osc52) :copy_visual))

(let [ufo (require :ufo)]
  (map! [n] "zR" '((. ufo :openAllFolds)))
  (map! [n] "zM" '((. ufo :closeAllFolds)))
  (map! [n] "zm" '((. ufo :closeFoldsWith))))
