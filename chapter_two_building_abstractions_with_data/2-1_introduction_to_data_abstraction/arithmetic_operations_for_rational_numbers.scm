; The general technique of isolating the parts of a program that deal with how data objects are represented from the parts of a program that deal with how data objects are used is a powerful design methodology called data abstraction.

;it's saying closure is going to become important here now

;The basic idea of data abstraction is to structure the programs that are to use compound data objects so that they operate on ``abstract data.'' That is, our programs should use data in such a way as to make no assumptions about the data that are not strictly necessary for performing the task at hand. At the same time, a ``concrete'' data representation is defined independent of the programs that use the data. The interface between these two parts of our system will be a set of procedures, called SELECTORS and CONSTRUCTORS, that implement the abstract data in terms of the concrete representation. To illustrate this technique, we will consider how to design a set of procedures for manipulating rational numbers.

;so, if the book provides the procedures

(define (add-rat x y)
    (
        make-rat 
            (+ 
                (* (numer x) (denom y))
                (* (numer y) (denom x))
            )
            (* 
                (denom x)
                (denom y)
            )
    )            
)

(define (sub-rat x y) 
    (
        make-rat 
            (- 
                (* (numer x) (denom y))
                (* (numer y) (denom x))
            )
            (* 
                (denom x) 
                (denom y)
            )
    )        
)

(define (mul-rat x y)
    (
        make-rat
            (*
                (numer x)
                (numer y)
            )
            (*
                (denom x)
                (denom y)
            )
    )
)

(define (div-rat x y)
    (
        make-rat 
            (* 
                (numer x)
                (denom y)
            )
            (*
                (denom x)
                (numer y)
            )
    )
)
(define (equal-rat? x y)
    (= 
        (*
            (numer x)
            (denom y)
        )
        (*
            (numer y)
            (denom x)
        )
    )
)

; that's all well and good, but we don't have the procedures numer denom or make-rat

; pairs

; mit-scheme has a data structure called a pair, it is made using the globally avialable procedure cons, which is short for constructor

(define x (cons 1 2))

(display x)

; there are two other globally available metods for getting the values from pairs, car returns the first and cdr returns the second

; these names are not helpful, they only exist for historical reasons

; for now, just remember that:
; car === returns 1st data point in a pair
; cdr === returns 2nd data point in a pair

(car x)

(cdr x)

(define compound (cons x 1))

(car compound)

; pairs, can be nested, as you can see above

; The single compound-data primitive pair, implemented by the procedures cons, car, and cdr, is the only 'glue' we need. Data objects constructed from pairs are called list-structured data

; we can use these methods to complete our rational numbers system

(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))
    )
)

; (define (make-rat n d) (cons n d))
 (define (make-rat n d)
    (
        let (
            (g (gcd n d))
        )
        (cons 
            (/ n g)
            (/ d g)
        )
    )
 )

(define (numer x) (car x))

(define (denom x) (cdr x))

(define two-thirds (make-rat 2 3))
(define one-half (make-rat 1 2))

(mul-rat two-thirds one-half)

(mul-rat one-half (make-rat 1 3))

; we can even modify our CONSTRUCTOR make-rat to reduce our primitives to their lowest terms by using the gcd function we wrote previously

; this is definitely a different way of doing things, and i imagine it will take a while to really get it

; again, it is important to underline the pattern of a CONSTRUCTOR make-rat and our SELECTORS numer and denom

; we could break down the package that we have written thusly

;--programs that use rational numbers--
;  procedures for public use to manipulate rational numbers
;-- add-rat sub-mat mul-rat div-rat equal-rat? --
; rational numbers made using pairs
;-- make-rat numer denom --
;global methods used to make the rational numbers using pairs
; cons car cdr
; primitives

; construct these methods with care for how often operations have to happen. for example, you could break the rational numbers down to their lowest terms when using the SELECTORS, but you would have to do that every time. it's better to get it over with in the CONSTRUCTOR and have it done and in memory for when you need it

; either way you choose to do it, that part of the program is discrete from the public methods and they will not need to be changed

; by only exposing the public procedures and the constructor, we free up mind space for the user. how does the rational number get made and how are elements of it accessed and modified? the user neither knows nor cares, all that matters for them is that the numerator and the denominator are supplied to make the rational numbers, and then the operations are performed and returned. that's as it should be

; abstraction also allows us to get work done on a project while deferring tough decisions about it's construction. don't know when to compute the gcd? that's fine, mull it over as you work on other stuff