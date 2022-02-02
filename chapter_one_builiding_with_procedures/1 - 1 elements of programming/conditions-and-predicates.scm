; there is a special form in list for control flow, cond

(define (abs x) (    
        cond 
            ((> x 0) x)
            ((= x 0) 0)
            ((< x 0) (- x))
        
    )
)

; we do NOT supply the statements to be evaluated to cond as a single statement, but as several statements not wrapped in parantheses

; here's a more concise way to write that

(define (concise-abs x) (
        cond 
            ((< x 0) (- x))
            (else x)
    )
)

;so, it can be said that we can use cond and else like a switch and default in js

;there is also an if statement, which it looks like is analogous to a ternary operator if js

(define (ternary-abs x) (if (< x 0) (- x) x))

; you could think of this as (if (boolean statement) (return if true) (return if false))

(define (between-5-and-10 x) (
    if (and (> x 4) (< x 11)) x 0
))

(define (is-not-5 x) (
    if (not 5) x 1000
))

(define (less-than-5-or-over-100 x) (
    if (or (< x 5) (> x 100)) x 0
))

(less-than-5-or-over-100 4)
(less-than-5-or-over-100 104)
(less-than-5-or-over-100 10)

(define should-be-ten-but-is-zero (less-than-5-or-over-100 10))

(+ should-be-ten-but-is-zero 5)

; there are normal logical operators, it's the same lispy jazz, operator first. it should be noted that if and not are operators, or special forms, and not is a procedure, or function as i think of it

(define (bool-bigger-than-5 x) (> x 5))

(bool-bigger-than-5 3)

; looks like i can write a simple boolean producing function as well, outputted here as #t or #f

(define (>= x y) (not (< x y)))
(define (<= x y) (not (> x y)))

(>= 16 10)
(<= 14 10)

;Exercise 1.1.  Below is a sequence of expressions. What is the result printed by the interpreter in response to each expression? Assume that the sequence is to be evaluated in the order in which it is presented.

;⛔️✅
10 ; 10 ✅
(+ 5 3 4) ; 12  ✅
(- 9 1) ; 8  ✅
(/ 6 2) ; 3  ✅
(+ (* 2 4) (- 4 6)) ; 6  ✅
(define a 3) ; 3  ✅
(define b (+ a 1)) ; 4
(+ a b (* a b)) ; (3 + 4) + 12 === 19 ✅
(= a b) ; #f ✅
(if (and (> b a) (< b (* a b)))
    b
    a) ; if b is larger than a AND b is less than a times b. so that should return 4 ✅
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25)) ; 16 ✅
(+ 2 (if (> b a) b a)) ;6 ✅
(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1)); 4 * 4 = 16 ✅


