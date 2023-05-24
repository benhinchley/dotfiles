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
; (hotkey.bind [:option] :return #(open-kitty-terminal))

(local hwm (require :user.hwm))

(hotkey.bind [:option :shift] :space #(hwm.highlight-window (hs.window.focusedWindow)))

(hotkey.bind [:option] :h #(hwm.focus-window-left))
(hotkey.bind [:option] :j #(hwm.focus-window-down))
(hotkey.bind [:option] :k #(hwm.focus-window-up))
(hotkey.bind [:option] :l #(hwm.focus-window-right))

;; remove window animations
(tset hs.window :animationDuration 0.0)

(each [_ m (ipairs [:MARGINX :MARGINY])]
  (tset grid m 10))

(fn current-screen-frame []
  (: (: (hs.window.focusedWindow) :screen) :frame))

(fn current-screen-uuid []
  (: (: (hs.window.focusedWindow) :screen) :getUUID))

(local grid-screen-vert-frame (hs.geometry.rect -1440.0 400.0 1440.0 1440.0))

(local home-display "05D68674-D749-4954-BFDF-EF01DA2E377D")
(local work-displays {:laptop "37D8832A-2D66-02CA-B9F7-8F30A301B230"
                      :main "7AD1BAC2-EC34-4DD8-B12A-AAE889193DD6"
                      :vert "08DD48DC-D608-4222-B7B1-DCC7418192FC"})

(let [hyper [:ctrl :option]
      hk (hotkey.modal.new hyper :w)
      home-grid (grid.setGrid "4x6" home-display)
      work-laptop-grid (grid.setGrid "4x6" work-displays.laptop)
      work-main-grid (grid.setGrid "4x6" work-displays.main)
      work-vert-grid (grid.setGrid "6x4" work-displays.vert grid-screen-vert-frame)]
  (hk:bind "" :escape #(hk:exit))

  (var border nil)
  (fn hk-entered []
    (when (not border)
      (set border (hs.canvas.new (current-screen-frame))))
    (border:assignElement {:type :rectangle
                           :action :stroke
                           :strokeWidth 10.0
                           :strokeColor {:red 1.0}} 1)
    (if (or (= (current-screen-uuid) work-displays.main)
            (= (current-screen-uuid) home-display)
            (= (current-screen-uuid) work-displays.laptop))
      (border:frame (current-screen-frame))
      (border:frame grid-screen-vert-frame))
    (border:show))

  (tset hk :entered #(hk-entered))
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
  (hk:bind :option :h #(hwm.focus-window-left))
  (hk:bind :option :j #(hwm.focus-window-down))
  (hk:bind :option :k #(hwm.focus-window-up))
  (hk:bind :option :l #(hwm.focus-window-right)))
