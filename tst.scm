( define (sqr x) (* x x) )
( define (sqr-ls ls) ( map (lambda (x) ( sqr x )) ls ) )

(define n ( list 1 2 3 4 ))
( sqr-ls n )

( define (to-num n) (string->number n) )
(define (cli-to-nums ls) (map (lambda (n) (to-num n)) ls))

(define arg-ls (cli-to-nums (command-line-arguments)))

(sqr-ls arg-ls)

(define (gaussian-sigma n) (/ ( * n ( + n 1 ) ) 2 ))

(gaussian-sigma 5)
