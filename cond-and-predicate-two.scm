; Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

(define (sqr x) (* x x))

(define (sum-square x y) (+ (sqr x) (sqr y)))

(define (sqr-of-two-largest a b c) (
        cond 
            ( (and (<= a b) (<= a c)) (sum-square b c) )
            ( (and (<= b a) (<= b c)) (sum-square a c) )
            ( else (sum-square a b) )
    )
)

(sqr-of-two-largest 3 2 5)

; huh, looks like there is <= and >=

; okay, you can define local variables with let, but i think it assumes you are going to do at least wo

;Exercise 1.4.  Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 2 -2)

; we're evaluating a statment to see which operator to use for a and b

;Square Roots by Newton's Method
(define (avg x y) (/ (+ x y) 2)) ; finally we have a pretty simple average function that only takes two numbers

(define (improve guess x) (avg guess (/ x guess))) ; when the guess is not good enough, we need a better guess. we get it by averageing the current guess and x divided by the current guess

(define (is-good-enough guess x) (< (abs (- (sqr guess) x)) 0.001)) ; here we square the guess and subtract the value x from it, take the absolute value of that and see if it is less than what we have defined for our tolerance

(define (sqrt-recursive guess x) (
        if (is-good-enough guess x)
            guess ; if the guess is close enough, return the guess as correct
            (sqrt-recursive (improve guess x) x) ; if it is not, we need to recalculate the guess and then call the function again
    )
)

(define (sqrt x) (sqrt-recursive 1.0 x)) ; here we have a hardcoded helper to get things started. here we assume the square root is one

;huh, looks like we need to make sure we include tht as a float. it's picky about that

(sqrt 9)

; the above are excellent examples of 'black-box' abstractions. for our purposes it only matters that each piece does what it is meant to, and it would be fine if it did it another way but produced the same result

; it is worthy pointing out that we reference things from the global scope , unbound variables and procedures, like abs. those are built in and are globally available. block scoping more or less seems to exist the way i expect it to. at least so far

;In an if expression the <consequent> and <alternative> must be single expressions.


; if we don't want to have a giant mess of small functions, we can just do it as a large function with all the sub functions in scope

; (define (sqrt2 x) (
;         (define (avg2 a b) (/ (+ a b) 2))
;         (define (improve2 guess ) (avg2 guess (/ x guess))) 
;         (define (is-good-enough2 guess) (< (abs (- (sqr guess) x)) 0.001)) 
;         (define (sqrt-recursive2 guess) ( if (is-good-enough2 guess x) guess (sqrt-recursive2 (improve2 guess x) x) ))

;         (sqrt-recursive2 1.0)
;     )
; )
; (sqrt2 9)

; or at least, we should be able to do that. it's throwing me an unbound variable error, and the error messages are kind of terrible in scheme, so i'm just gonna peace on that.

; So i've worked through this part kind of okay. i need a better handling on the scoping and how exactly the evaluator works. but that will come with time.