;; To realize the product of 2^a3^b, first we need to define a exponentiation.
;; Assume that a and b are both nonnegative integer.
(define (expt a b) (exp (* (log a) b)))
(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (selector n)
  (define (iter product result)
    (if (= (modulo product n) 0)
        (iter (/ product n) (+ 1 result))
        result))
  (lambda (z n) (iter z n)))

(define (car z)
  ((selector 2) z 0))

(define (cdr z)
  ((selector 3) z 0))

(car (cons 2 3))
;; However, this method will perform differen complexity due to the
;; input of pairs.
