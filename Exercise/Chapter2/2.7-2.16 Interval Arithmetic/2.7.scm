;; Here is a definition of the interval constructor:
(define (make-interval a b) (cons a b))

;; Define selectors upper-bound and lower-bound to complete the implementation.

(define (upper-bound z)
  (car z))
(define (lower-bound z)
  (cdr z))
