;; I will give another implementation of cons procedure
(define (cons x y)
  (define (first-element? retreives)
    (if retreives
        x
        y))
  first-element?)
(define (car z) (z #t))
(define (cdr z) (z #f))
;; This uses only boolean value rather than integer numbers.
;; This style of programming is often called message passing.

(cons (cons 1 4) 7)
(car (cons (cons 1 4) 7))
(cdr (cons (cons 1 4) 7))
(cdr (car (cons (cons 1 4) 7)))
