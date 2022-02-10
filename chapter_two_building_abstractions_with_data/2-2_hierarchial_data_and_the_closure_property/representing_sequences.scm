;in this section we will learn about how to use the closure property to make compound data structures.

;The ability to create pairs whose elements are pairs is the essence of list structure's importance as a representational tool. We refer to this ability as the closure property of cons. In general, an operation for combining data objects satisfies the closure property if the results of combining things with that operation can themselves be combined using the same operation

;will this be about linked lists? let's see

(define linked-list 
    (cons 1 
        (cons 2
            (cons 3
                (cons 4 #f)
            )
        )
    )
)

(define sugar-list (list 1 2 3 4))

; the above two data structures are the same, more or less. so it seems that a scheme can be described like a linked list and like an array depending on the tool used

(car sugar-list)
(cdr sugar-list)

(define sugar-list-after-one (cdr sugar-list))

(car sugar-list-after-one)
(cdr sugar-list-after-one)

;We can think of car as selecting the first item in the list, and of cdr as selecting the sublist consisting of all but the first item. Nested applications of car and cdr can be used to extract the second, third, and subsequent items in the list.9 The constructor cons makes a list like the original one, but with an additional item at the beginning.

(cons 5 sugar-list-after-one)

(define (list-ref items n)
    (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))
    )
)

(define sq (list 1 4 9 16 25))

(list-ref sq 3)

; (1 4 9 16 25) 3 -> (4 9 16 25) 2 -> (9 16 25) 1 -> (16 25) 0 -> car (16 25) -> 16

;Often we cdr down the whole list. To aid in this, Scheme includes a primitive predicate null?, which tests whether its argument is the empty list. The procedure length, which returns the number of items in a list, illustrates this typical pattern of use:

(define (length-recur items)
    (if (null? items)
        0
        (+ 1 (length-recur (cdr items)))
    )
)

(define odds (list 1 3 5 7))

(length-recur odds)

;(1 3 5 7) -> + 1 (3 5 7) -> + 1 (5 7) -> + 1 (5 7) -> + 1 (7)  -> () -> 0 -> +1 -> +1 -> +1 -> +1 -> 4 

(define (length-iter items len)
    (if (null? items)
        len
        (length-iter (cdr items) (+ 1 len))
    )
)

(define (len items) (length-iter items 0))


(len odds)

;(1 3 5 7) 0 -> (3 5 7) 1 -> (5 7) 2 -> (7) 3 -> () 4 -> 4

(define (merge list1 list2)
    (if (null? list1)
        list2
        (cons (car list1) (merge (cdr list1) list2))
    )
)

(merge (list 1 2 3) (list 4 5 6))

;okay, so i won't lie: the above is just a bit confusing

; Exercise 2.17.  Define a procedure last-pair that returns the list that contains only the last element of a given (nonempty) list:

(define (last-pair-recur l ele) 
    (if (null? l)
        (list ele)
        (last-pair-recur (cdr l) (car l))
    )
)

(define (last-pair l) (last-pair-recur l #f))

(last-pair (list 23 72 149 34)) ; -> (34)

; Exercise 2.18.  Define a procedure reverse that takes a list as argument and returns a list of the same elements in reverse order:

(define (reverse-recur orig new)
    (cond
        ((null? orig) new)
        ((null? new) (reverse-recur (cdr orig) (list (car orig))))
        (else (reverse-recur (cdr orig) (cons (car orig) new)))
    )
)

(define (reverse l) (reverse-recur l ()))

(reverse (list 1 4 9 16 25)) ; -> (25 16 9 4 1)

; The procedures +, *, and list take arbitrary numbers of arguments. One way to define such procedures is to use define with dotted-tail notation. In a procedure definition, a parameter list that has a dot before the last parameter name indicates that, when the procedure is called, the initial parameters (if any) will have as values the initial arguments, as usual, but the final parameter's value will be a list of any remaining arguments. For instance, given the definition

; (define (f x y . z) <body>)

; the procedure f can be called with two or more arguments. If we evaluate

; (f 1 2 3 4 5 6)

; then in the body of f, x will be 1, y will be 2, and z will be the list (3 4 5 6). Given the definition

(define (return-the-list a b . c) c)

(return-the-list 1 2 3 4 5 6 7) ; -> (3 4 5 6 7)