(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (factorial n) (product (lambda(i) i) 1 (lambda(i) (+ i 1)) n))

(define (pi-product a b)
  (define (pi-term x) (/ (* (- x 1.0) (+ x 1.0)) (* x x)))
  ;; Here try to convert the number into float.
  (define  (pi-next x) (+ x 2))
  (product pi-term a pi-next b))

(factorial 5)
(* 4 (pi-product 3 21))

;; The output seems this method for calculating pi is too slow.
;; Before it runs out of the recursion depth, the accuracy can't
;; step further than 5 digits.
