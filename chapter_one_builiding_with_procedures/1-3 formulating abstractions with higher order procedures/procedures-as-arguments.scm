;One of the things we should demand from a powerful programming language is the ability to build abstractions by assigning names to common patterns and then to work in terms of the abstractions directly. Procedures provide this ability. This is why all but the most primitive programming languages include mechanisms for defining procedures.

; but we also must have higher-order-procedures/functions, these are procedures/functions that can take other procedures/functions as arguments or return them as values

; for example, consider the following procedures

(define (sum-ints-recur a b) (
    if (> a b)
        0
        (+ a (sum-ints (+ a 1) b))
    )
)

(define (sum-ints-iter a b sum) (
    if (> a b)
        sum
        (sum-ints-iter a (- b 1) (+ sum b))
    )
)
(define (sum-int-range start end) (sum-ints-iter start end 0))

; 3 + 4 + 5 + 6 + 7 = 25

(sum-int-range 1 4)

; i made it into an iterative process!

; so this part talks about higher order functions, which i understand as a general thing. i mostly use them in conjuction with arrays.

; while i understand the concepts, i don't understand a lot of the math, and i'm not certain things need to be abstracted this much honestly

; but i do understand HOFs accepting and returning functions as values. most of the time anyway