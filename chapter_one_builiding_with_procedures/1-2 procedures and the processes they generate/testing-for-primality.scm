(define (divides? a b) (= (remainder b a) 0))

(define (find-divisor n test-divisor) (
    cond
        ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))
    )
)

(define (smallest-divisor n) (find-divisor n 2))

(define (prime? n) (= n (smallest-divisor n)))

(prime? 4)
(prime? 5)

; okay, you've heard this a lot from me now, but the things this book is talking about are a bit over my head in terms of math. and that's okay. i may revisit some of these things after taking a proper discrete math course.

; the most important thing i got from this section is to know the difference between linear recursive processes and linear iterative processes and how they compute and use resources differently