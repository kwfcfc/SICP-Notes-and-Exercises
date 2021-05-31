;; Rewrite the sum procedure into iteratively performed procedure?
(define (sum-recursion term a next b)
  (if (or (> a b) (= a b))
      0
      (+ (term a)
         (sum term (next a) b))))

;; Hints on the book make this question a blank filling one.
(define (sum-iteration term a next b)
  (define (iter a result)
    (if (or (> a b) (= a b))
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))
