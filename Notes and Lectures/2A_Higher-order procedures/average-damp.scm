(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda(x) (average (f x) x)))

(define (f x)
  (/ 1 x))
