(local {:application app
        :hotkey hotkey
        :logger logger} hs)

(local log (logger.new :user :debug))

;; reload hammerspoon config
(hotkey.bind [:option :shift] :c #(hs.reload))

(fn open-kitty-terminal []
  (let [kitty (app.get "net.kovidgoyal.kitty")]
    (if kitty (kitty:selectMenuItem ["Shell" "New OS Window"])
      (app.launchOrFocus "net.kovidgoyal.kitty"))))

;; open new terminal
(hotkey.bind [:option] :return #(open-kitty-terminal))
