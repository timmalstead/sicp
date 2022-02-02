; it looks like the previous part 'orders of growth' is about how resource cost can grow exponnetially. so, related to big 0 i think. again, it looks like it touches a bunch of math i've never used, so i'm gonna skip it for the moment.

; write a procedure that takes a base number bs and and an exponent ex, do this in a linear recursive style. remember this involves a product, so multiplication

(define (exp-recur bs ex) (
        if (= ex 0)
        1
        (* bs (exp-recur bs (- ex 1)))
    )
)
(exp-recur 4 3)

(define (exp-iter bs i product) (
        if (= i 0)
            product
            (exp-iter
                bs
                (- i 1)
                (* bs product)
            )
    )
)

(define (exponent bs ex) ( exp-iter bs ex 1 ))

(exponent 4 3)
; alright, not bursting with pride over this fact but i had to look up how to do the iterative version. the trick is to use the exponent as the iterator and keep track of the product in a separate variable

; the iterable fashion will be tail recursive, so less work for your poor computer

; again, it is keeping track of the FINAL PRODUCT as it evolves
; it needs less space
