(local {:application app
        : hotkey
        : grid} hs)

;; reload hammerspoon config
(hotkey.bind [:option :shift] :c #(hs.reload))

(fn open-kitty-terminal []
  (let [kitty (app.get "net.kovidgoyal.kitty")]
    (if kitty (kitty:selectMenuItem ["Shell" "New OS Window"])
      (app.launchOrFocusByBundleID "net.kovidgoyal.kitty"))))

;; open new terminal
(hotkey.bind [:option] :return #(open-kitty-terminal))

(local hwm (require :user.hwm))

(hotkey.bind [:option :shift] :space #(hwm.highlight-window (hs.window.focusedWindow)))

;; (hotkey.bind [:option] :h #(hwm.focus-window-left))
;; (hotkey.bind [:option] :j #(hwm.focus-window-down))
;; (hotkey.bind [:option] :k #(hwm.focus-window-up))
;; (hotkey.bind [:option] :l #(hwm.focus-window-right))

;; remove window animations
(tset hs.window :animationDuration 0.0)

(each [_ m (ipairs [:MARGINX :MARGINY])]
  (tset grid m 10))

(tset grid :GRIDHEIGHT 4)
(tset grid :GRIDWIDTH 6)

(fn current-screen-frame []
  (: (: (hs.window.focusedWindow) :screen) :frame))

(let [hyper [:ctrl :option]
      hk (hotkey.modal.new hyper :w)
      border (hs.canvas.new (current-screen-frame))]
  (border:appendElements {:type :rectangle
                          :action :stroke
                          :strokeWidth 10.0
                          :strokeColor {:red 1.0}})

  (hk:bind "" :escape #(hk:exit))

  (tset hk :entered (lambda []
                      (border:frame (current-screen-frame))
                      (border:show)))

  (tset hk :exited #(border:hide))

  ;; movement
  (hk:bind "" :h #(grid.pushWindowLeft))
  (hk:bind "" :j #(grid.pushWindowDown))
  (hk:bind "" :k #(grid.pushWindowUp))
  (hk:bind "" :l #(grid.pushWindowRight))

  ;; resizing
  (hk:bind :shift :h #(grid.resizeWindowThinner))
  (hk:bind :shift :j #(grid.resizeWindowTaller))
  (hk:bind :shift :k #(grid.resizeWindowShorter))
  (hk:bind :shift :l #(grid.resizeWindowWider))

  ;; focus
  (hk:bind :ctrl :h #(hwm.focus-window-left))
  (hk:bind :ctrl :j #(hwm.focus-window-down))
  (hk:bind :ctrl :k #(hwm.focus-window-up))
  (hk:bind :ctrl :l #(hwm.focus-window-right)))
