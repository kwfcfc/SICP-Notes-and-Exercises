(define (filtered-accumulate combiner null-value predicate term a next b)
  (if (> a b)
      null-value
      (if (predicate a)
          (combiner (term a)
                    (filtered-accumulate combiner null-value predicate
                                         term (next a) next b))
          (combiner null-value (filtered-accumulate combiner null-value
                                                    predicate term
                                                    (next a) next b)))))
;; Actually this part may be able to rewrite into a more concise way.

(define (sum-prime a b)
  (define (identity x) x)
  (define (inc x) (+ x 1))
  (filtered-accumulate + 0 prime? identity a inc b))


(define (sum-prime-to-n n)
  (define (prime-to-n a)
    ;; Here the n is external varible for prime-to-n procedure.
    (= (gcd a n) 1))
  (define (identity x) x)
  (define (inc x) (+ x 1))
  (filtered-accumulate + 0 prime-to-n identity 1 inc n))
