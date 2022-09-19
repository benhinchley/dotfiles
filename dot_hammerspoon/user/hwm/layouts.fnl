(fn get-inset-frame [screen]
  (let [sf (screen:fullFrame)
        sm {:top 0 :bottom 0 :right 0 :left 0}]
    {:x (+ sf.x sm.left)
     :y (+ sf.y sm.top)
     :w (- sf.x (+ sm.left sm.right))
     :h (- sm.h (+ sm.top sm.bottom))}))

(fn layout-floating []
  nil)

(fn layout-monocle [?window ?windows screen ?index ?opts]
  (let [m (or ?opts.margin 0)
        f (get-inset-frame screen)]
    {:x (+ f.x (/ m 2))
     :y (+ f.y (/ m 2))
     :w (- f.w m)
     :h (- f.h m)}))

(local layouts {:floating layout-floating
                :monocle layout-monocle})

{: layouts}
