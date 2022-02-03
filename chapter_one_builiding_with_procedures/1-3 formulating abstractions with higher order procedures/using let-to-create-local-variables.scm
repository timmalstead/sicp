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