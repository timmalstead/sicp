(define (avg x y) (/ (+ x y) 2))
(define (improve guess x) (avg guess (/ x guess)))
(define (is-good-enough guess x) (< (abs (- (* guess guess) x)) 0.001))
(define (sqrt-recursive guess x) (
    if (is-good-enough guess x)
      guess
      (sqrt-recursive (improve guess x) x)
  )
)
(define (sqrt x) (sqrt-recursive 1.0 x))

(sqrt 9)