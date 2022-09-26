;; hammerspoon tiling wm
;; inspired by https://github.com/szymonkaliski/hhtwm

(local {:logger logger
        :spaces spaces
        :window win} hs)

(local {: layouts} (require :user.hwm.layouts))

(local log (logger.new "hwm" "debug"))

(local win-filter
  (: (: (win.filter.new) :setDefaultFilter) :setOverrideFilter {:visible true
                                                                :fullscreen false
                                                                :currentSpace true
                                                                :allowRoles ["AXStandardWindow"]}))

(fn tile []
  (when (= (#hs.mouse.getButtons) 0)
    (log:d "tiling function goes here")))

(fn highlight-window [window]
  (let [cnvs (hs.canvas.new (window:frame))
        elem {:type :rectangle
              :action :stroke
              :strokeWidth 10.0
              :strokeColor {:red 1.0 :green 1.0}}]
    (cnvs:appendElements elem)
    (cnvs:show)
    (hs.timer.doAfter 0.3 #(cnvs:hide))))

(macro focus-window [direction ?window]
  `(let [fw# (or ?window (win.focusedWindow))]
    (: win-filter (.. "focusWindow" ,direction) fw# nil true)
    (win.focusedWindow)))

(fn focus-window-left [?window]
  (focus-window :West ?window))

(fn focus-window-down [?window]
  (focus-window :South ?window))

(fn focus-window-up [?window]
  (focus-window :North ?window))

(fn focus-window-right [?window]
  (focus-window :East ?window))

;; (fn move-window-left [] )
;; (fn move-window-down [] )
;; (fn move-window-up [] )
;; (fn move-window-right [] )

;; (fn move-window-to-workspace [window-id workspace-id] )
;; (fn set-workspace-layout [workspace-id layout-id] )

;; (fn kill-window [window-id] )
;; (fn toggle-window-float [window-id] )

;; (fn focus-screen [screen-id] )

{: highlight-window
 : focus-window-left
 : focus-window-down
 : focus-window-up
 : focus-window-right}
