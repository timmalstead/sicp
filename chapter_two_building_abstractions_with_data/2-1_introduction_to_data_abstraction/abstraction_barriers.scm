;In general, the underlying idea of data abstraction is to identify for each type of data object a basic set of operations in terms of which all manipulations of data objects of that type will be expressed, and then to use only those operations in manipulating the data.

;Exercise 2.2.  Consider the problem of representing line segments in a plane. Each segment is represented as a pair of points: a starting point and an ending point.

;Define a constructor make-segment and selectors start-segment and end-segment that define the representation of segments in terms of points.

;Furthermore, a point can be represented as a pair of numbers: the x coordinate and the y coordinate. Accordingly, specify a constructor make-point and selectors x-point and y-point that define this representation.

;Finally, using your selectors and constructors, define a procedure midpoint-segment that takes a line segment as argument and returns its midpoint (the point whose coordinates are the average of the coordinates of the endpoints)

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (make-segment start end) (cons start end))
(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))


; (let* ((a 1) (b 1) (c (* a b))) c)
(define (avg-segment seg) 
    (
        let* (
            (start (start-segment seg))
            (end (end-segment seg))
            (start-x (x-point start))
            (start-y (y-point start))
            (end-x (x-point end))
            (end-y (y-point end))
            (avg-x (/ (+ start-x end-x) 2.0))
            (avg-y (/ (+ start-y end-y) 2.0))
        )
        (make-point avg-x avg-y)
    )
)

(define start-point (make-point 3 5))
(define end-point (make-point 7 10))
(define test-seg (make-segment start-point end-point))

(avg-segment test-seg)

; okay, had to learn about how closure works in scheme. the special form let cannot be called multiple times to work on variables iteratively, use let* and then you can reference variables after they have been made. i would be lying if i said i understood this completely

; so we see we can make a function by breaking it down to constructors and selectors