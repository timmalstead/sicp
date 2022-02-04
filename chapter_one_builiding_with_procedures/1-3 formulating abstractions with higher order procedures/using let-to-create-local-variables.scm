; let variables are meant to be local variables in the body of a procedure

; The general form of a let expression is

; (let ((<var1> <exp1>)
;       (<var2> <exp2>)
      
;       (<varn> <expn>))
;    <body>)

; which can be thought of as saying

; let	<var1> have the value <exp1> and
; <var2> have the value <exp2> and

; <varn> have the value <expn>
; in	<body>

(define (complex x) (
    let (
            (a (* x 5))
            (b (+ x 25))
        )
    (+ x (* a b))
    )
)

(complex 10)

; 10 + (50 * 35) = 1760

; okay, from 1.3.3 on i think this math is beyond where i'm at right now.

; i may come back and revisit procedures as general methods, finding fixed points of functions and procedures as returned values and the attendant exercises after i've done some of the math in the teach yourself cs course

; the idea of procedures as first class is helpful though. i've heard the term here and there. it means that: they may be named as variables, they may be passed as arguments, they may be returned as the results of procedures and they may be included in data structures.

;i still think that the biggest takeaway thus far is understanding order and tail recursion better