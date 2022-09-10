(require-macros :hibiscus.vim)
(local {: setup} (require :nvim.pkg))

(setup :notify {:background_colour "#020221"
                :render :minimal})
(tset vim :notify (require :notify))
