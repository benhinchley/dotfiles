(fn setup [package ?opts]
  ((. (require package) :setup) (or ?opts {})))

{: setup}