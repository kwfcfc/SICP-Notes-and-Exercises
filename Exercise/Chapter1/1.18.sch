;; Using the results of Exercise 1.16: 44 and Exercise
;; 1.17: 44, devise a procedure that generates an iterative process for
;; multiplying two integers in terms of adding, doubling, and halving
;; and uses a logarithmic number of steps.

;; Three primitive procedures.
(define (double x)
  (* x 2))
(define (halve x)
  (/ x 2))
(define (even? n)
  (= (remainder n 2) 0))

;; Here is the answer.
(define (fast-mul-iter x y)
  ;; Remember that the formal arguments of inner function
  ;; should not be confused with outer function.
  (define (iterative a b c)
    (cond ((= b 0) c)
          ;; The reason that b = 0 must be put here instead of
          ;; outer function of fast-mul-iter, is because it will trap
          ;; into a dead loop of b = 0.
          ((even? b)
           (iterative (double a) (halve b) c))
          (else
           (iterative a (- b 1) (+ a c)))))
      (iterative x y 0))
;
(fast-mul-iter 3 2)
