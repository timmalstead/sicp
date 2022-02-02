;The greatest common divisor (GCD) of two integers a and b is defined to be the largest integer that divides both a and b with no remainder. For example, the GCD of 16 and 28 is 4.

(define (gcd a b) (
    if (= b 0)
        a
        (gcd b (remainder a b))
    )
)

(gcd 207 40)

; okey doke. i kind of get the above but i don't get lame's theorem nor 1.20

; that's alright, i will try to work through them on a sucessive re read