(load "./2.9.scm")
(define (make-interval a b) (cons a b))
(define (lower-bound z) (car z))
(define (upper-bound z) (cdr z))

;; this is the original code designed by Alyssa.
(define (div-interval x y)
  (mul-interval
   x
   (make-interval (/ 1 (upper-bound y))
                  (/ 1 (lower-bound y)))))

;; To define a division we must first find the reciprocal of a interval
;; and then multiply it. In order to define such a interval, we should define a
;; function that give the union of two intervals.

(define (div-interval x y)
  (if (and (< (lower-bound y) 0) (> (upper-bound y) 0))
      (display "error, divide by an interval that spans zero")
      (mul-interval
       x
       (make-interval (/ 1 (upper-bound y))
                      (/ 1 (lower-bound y))))))
