;In general, we can think of data as defined by some collection of selectors and constructors, together with specified conditions that these procedures must fulfill in order to be a valid representation.

; (define (cons x y)
;   (define (dispatch m)
;     (cond ((= m 0) x)
;           ((= m 1) y)
;           (else (error "Argument not 0 or 1 -- CONS" m))))

;   dispatch)

; the above code is meant to illustrate that we could create cons ourself if wanted to using nothing but procedures. won't lie, it kind of breaks my brain a bit and is written differently than i have seen scheme code written thus far

;This example also demonstrates that the ability to manipulate procedures as objects automatically provides the ability to represent compound data. 

;okey doke. seems like the general pattern of this book is:
; useful info about programming and concepts thereof -> a whole bunch of math that i don't get to prove that it is accurate.

; happy to read the former, will come back to the latter