;Square Roots by Newton's Method
(define (avg x y) (/ (+ x y) 2)) ; finally we have a pretty simple average function that only takes two numbers

(define (improve guess x) (avg guess (/ x guess))) ; when the guess is not good enough, we need a better guess. we get it by averageing the current guess and x divided by the current guess

(define (is-good-enough guess x) (< (abs (- (* guess guess) x)) 0.001)) ; here we square the guess and subtract the value x from it, take the absolute value of that and see if it is less than what we have defined for our tolerance

(define (sqrt-recursive guess x) (
    if (is-good-enough guess x)
      guess ; if the guess is close enough, return the guess as correct
      (sqrt-recursive (improve guess x) x) ; if it is not, we need to recalculate the guess and then call the function again
  )
)

(define (sqrt x) (sqrt-recursive 1.0 x)) ; here we have a hardcoded helper to get things started. here we assume the square root is one

;huh, looks like we need to make sure we include tht as a float. it's picky about that

(sqrt 9)