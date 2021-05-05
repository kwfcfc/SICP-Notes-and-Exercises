(define (sum-of-inputs x y z)
  (define (square a) (* a a))
  (define (sum-of-square a b) (+ (square a) (square b)))
  (cond ((and (< x y) (< x z)) (sum-of-square y z))
        ((and (< y x) (< y z)) (sum-of-square x z))
        ((and (< z x) (< z y)) (sum-of-square x y))))
;;This program somehow uses spare code in the condition judgment part.
;;It is helpful if another function can be designed to tell which is the minimum.

(sum-of-inputs 3 4 5)
