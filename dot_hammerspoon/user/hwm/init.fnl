;; hammerspoon tiling wm
;; inspired by https://github.com/szymonkaliski/hhtwm

(local {:logger logger
        :spaces spaces
        :window win} hs)

(local {: layouts} (require :user.hwm.layouts))

(local log (logger.new "hwm" "debug"))

(fn highlight-window [window]
  (let [cnvs (hs.canvas.new (window:frame))
        elem {:type :rectangle
              :action :stroke
              :strokeWidth 5.0
              :stokeColor {:red 1.0 :green 1.0}}]
    (cnvs:appendElements elem)
    (hs.time.doAfter 0.3 #(cnvs:delete))))

(fn focus-window-left [?window]
  (let [fw (or ?window (win.focusedWindow))
        curr-workspace win.filter.defaultCurrentSpace]
    (curr-workspace:focusWindowWest fw nil true)
    (win.focusedWindow)))

(fn focus-window-down [?window]
  (let [fw (or ?window (win.focusedWindow))
        curr-workspace win.filter.defaultCurrentSpace]
    (curr-workspace:focusWindowSouth fw nil true)
    (win.focusedWindow)))

(fn focus-window-up [?window]
  (let [fw (or ?window (win.focusedWindow))
        curr-workspace win.filter.defaultCurrentSpace]
    (curr-workspace:focusWindowNorth fw nil true)
    (win.focusedWindow)))

(fn focus-window-right [?window]
  (let [fw (or ?window (win.focusedWindow))
        curr-workspace win.filter.defaultCurrentSpace]
    (curr-workspace:focusWindowEast fw nil true)
    (win.focusedWindow)))

;; (fn move-window-left [] )
;; (fn move-window-down [] )
;; (fn move-window-up [] )
;; (fn move-window-right [] )

;; (fn switch-workspace [workspace-id] )
;; (fn move-window-to-workspace [window-id workspace-id] )
;; (fn set-workspace-layout [workspace-id layout-id] )

;; (fn kill-window [window-id] )
;; (fn toggle-window-float [window-id] )

;; (fn focus-screen [screen-id] )
