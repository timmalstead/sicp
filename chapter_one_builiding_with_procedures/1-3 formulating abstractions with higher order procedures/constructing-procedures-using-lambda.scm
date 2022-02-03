;a lambda is used to create procedures in the same way as define, except that no name is specified for the procedure:

;(lambda (<formal-parameters>) <body>)

; very useful for built in HOFs in scheme like map

; (define (plus4 x) (+ x 4))

;is equivalent to

(define plus4 (lambda (x) (+ x 4)))

(plus4 6)

;okey doke. this is like the difference between a named function in js and an anonoymus oen with an arrow. you can bind it to a variable, but it won't hoist and when you call it you are calling the variable pointing to it

; very very similar
