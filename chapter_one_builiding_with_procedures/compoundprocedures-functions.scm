; to define a procedure, which is a function by another name as far as i can tell, you also use the define keyword

; you are defining a statement to execute though, so you define the name and the parameters in one set of parantheses and the body in the next

(define (square x) (* x x))

; this can be done as 
; (define (<name> <formal parameters>) (<body>))
; is there a return statement? that would allow more complex functionality

(square 5)

; (define (square-plus-one x) (+ (* x x) 1))

; (square-plus-one 5)

(+ (square 5) (square 4))

; oh no, no return statement. wotta nightmare
; looks like '-' is the common delimiter in lisp

; when a calling of a compound prodecure is evaluated, a function remember, it evaluates the body of the procedure with each parameter of the compound procedure replaced by the corresponding argument.
; this is called the substitution model
; this is a way of thinking about the interpreter and compiler that is useful for now
; okay, i get why they used this language, it does break it down
