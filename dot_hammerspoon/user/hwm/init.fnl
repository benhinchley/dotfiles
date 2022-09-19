;; hammerspoon tiling wm
;; inspired by https://github.com/szymonkaliski/hhtwm

(local {:logger logger
        :spaces spaces} hs)

(local {: layouts} (require :user.hwm.layouts))

(local log (logger.new "hwm" "debug"))
