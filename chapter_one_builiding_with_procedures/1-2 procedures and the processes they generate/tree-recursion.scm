; ; let us consider the fibonacci sequence

; (define (fib-recur n)
;   (cond ((= n 0) 0)
;         ((= n 1) 1)
;         (else (+ (fib-recur (- n 1))
;                  (fib-recur (- n 2))))))

; (fib-recur 5)

; ; the procedure is called twice each time before it reaches the base case, thus creating a new branch. so there will be a lot of repeated work as the branches all work their way toward 1 or 0

; (define (fib-iter a b count) (
;     (if (= count 0)
;         b
;         (fib-iter
;             (+ a b)
;             a
;             (- count 1)
;         )
;     )
; )

; (define (fib n) (fib-iter 1 0 n))

; (fib 5)
; ;fib-iter 1 0 5 -> fib-iter 1 1 4 -> fib-iter 2 1 3 -> fib-iter 3 2 2 -> fib-iter 5 3 1 -> fib-iter 8 5 0 -> 5 

; ; okey doke, here we go with a coin counting alogrithm

; (define (first-denomination kinds-of-coins) (
;     cond 
;         ((= kinds-of-coins 1) 1)
;         ((= kinds-of-coins 2) 5)
;         ((= kinds-of-coins 3) 10)
;         ((= kinds-of-coins 4) 25)
;         ((= kinds-of-coins 5) 50)
;     )
; )

; (define (cc amount kinds-of-coins) (
;         cond 
;             ((= amount 0) 1) ; im amount equals zero, return one
;             ((or (< amount 0) (= kinds-of-coins 0)) 0) ;if amount is less than zero or if kinds of coins equal zero, return 0
;             (else 
;                 (+ ; add the result of
;                     (cc 
;                         amount
;                         (- kinds-of-coins 1)
;                     ) ; another call of cc with the same amount and kinds of coins minus one as the arguments
;                     (cc 
;                         (- amount (first-denomination kinds-of-coins))
;                         kinds-of-coins
;                     ) ; to another call fo cc with the amount minus the first denominatinon and the kinds of coins as the arguements
;                 )
;             )
;     )
; )

; (define (count-change amount) (cc amount 5))

; (count-change 100)
;i'm not certain why but this is not working. i'm okay chalking it up to stuff i don't understand now but hopefull will

;Exercise 1.11.  A function f is defined by the rule that 

;f(n) = n if n<3 ; in n is less than three return n
;and
;f(n) =  ; add together
;f(n - 1) another call with n - 1
;+ 
;2f(n - 2) another call with n -2 times 2
;+ 
;3f(n - 3)  another call with n - 3 times 3
;if n> 3

;Write a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process.

; looking at an iterative process and i don't get it, but i think i can do the tree recursive process

; (define (f-recur n) (
;         if (< n 3)
;             n
;             (+
;                 (f-recur (- n 1))
;                 (* 2 (f-recur (- n 2)))
;                 (* 3 (f-recur (- n 3)))
;             )
        
;     )
; )



; (f-recur 7)

; what a pain. i'm still getting used to what needs to be evaluated and what doesn't

; the rest of the exercises deal with math i have no knowledge of. perhaps i will come back and do those when i do have some knowledge of them induction or whatever

; it looks like the next part 'orders of growth' is about how resource cost can grow exponnetially. so, related to big 0 i think. again, it looks like it touches a bunch of math i've never used, so i'm gonna skip it for the moment.