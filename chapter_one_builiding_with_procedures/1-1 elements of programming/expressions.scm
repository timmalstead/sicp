; to run type mit-scheme < ex.scm
(+ 5 5)

(+ (* 3
      (+ (* 2 4)
         (+ 3 5)))
   (+ (- 10 7)
      6))

(+
    (+
        ( * 15 3 )
        ( * 6 7 )
    )
    (-
        ( * 15 5 )
        1
    )
)

; a complex (to me) expression like the above is recursive in nature. it figures out the values, calling the given operators and figuring out each subcombination as it works its way up the tree