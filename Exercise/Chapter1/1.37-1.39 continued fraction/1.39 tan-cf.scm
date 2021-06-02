;; Define a procedure (tan-cf x k) that computes an approximation to the tangent
;; function based on Lambert’s formula.

(define (cont-frac N D k)
  (define (iteration i result)
    (if (< i 1)
        result
        (iteration (- i 1) (/ (N i) (+ (D i) result)))))
  (iteration k 0))

(define (N x)
  (lambda (i)
    (if (= i 1)
        x
        (- 0 (square x)))))

(define (tan-cf x k)
  (cont-frac (N x) (lambda (i) (- (* 2 i) 1)) k))

(define pi (* 2 (asin 1)))
(tan-cf (/ pi 4) 5)
