(local {:application app
        :hotkey hotkey} hs)

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

(hotkey.bind [:option] :h #(hwm.focus-window-left))
(hotkey.bind [:option] :j #(hwm.focus-window-down))
(hotkey.bind [:option] :k #(hwm.focus-window-up))
(hotkey.bind [:option] :l #(hwm.focus-window-right))
