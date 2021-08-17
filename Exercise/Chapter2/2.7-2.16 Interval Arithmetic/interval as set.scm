(define (set condition)
  (lambda(x)
    (if (condition x)
        1
        0)))

(define empty-set
  (define (condition x) #f)
  (set condition))

(define (union-set x y) ;; 并集运算
  (define (condition l) (or (= (x l) 1) (= (y l) 1)))
  (set condition))

(define (intersection-set x y) ;; 交集运算
  (define (condition l) (and (= (x l) 1) (= (y l) 1)))
  (set condition))

;; The following is about intervals.
(load "./2.9.scm")
(define (interval2set z)
  (define (condition x) (let (((lower-bound z) a) ((upper-bound z) b))
                          (or (and (< a x) (< x b))
                              (= x a) (= x b))))
  (set condition))

(define (reciprocal z)
  (define (condition-with-zero x)
    (or (< x (/ 1 (lower-bound z))) (> x (/ 1 (upper-bound z)))))
  (if (= (z 0) 1)
      (set condition-with-zero)
      (make-interval (/ 1 (upper-bound z))
                     (/ 1 (lower-bound z)))))


(define (div-interval a b)
  (mul-interval a (reciprocal b)))

;; Here we see a difficulty of interval arithmetic: a set can not be treated as
;; a number(although a set can have only one number as its element.)
;; An interval with a width larger than zero has infiniter numbers, and for some
;; intervals its boundary is not certain(such as open intervals). Therefore, to
;; do interval arithmetic is something that simulate the result with two
;; endpoints.
