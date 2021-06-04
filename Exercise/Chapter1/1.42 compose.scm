;; Define a procedure compose that implements composition of
;; two one-argument functions.

(define (compose f g)
  (lambda (x) (f (g x))))

(define (inc x) (+ 1 x))
(define (square x) (* x x))

((compose square inc) 6)
