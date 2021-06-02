;; Here is the cont-frac (iterative version) procedure.
(define (cont-frac N D k)
  (define (iteration i result)
    (if (< i 1)
        result
        (iteration (- i 1) (/ (N i) (+ (D i) result)))))
  (iteration k 0))

(define (Di i)
  (if (= (remainder i 3) 2)
      (* (+ (quotient i 3) 1) 2)
      1))
(+ 2 (cont-frac (lambda (i) 1.0) Di 11))
