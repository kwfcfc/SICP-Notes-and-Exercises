;; Define a procedure cont-frac such that evaluating (cont-frac n d k) computes
;; the value of the k-term finite continued fraction.

(define (cont-frac-recur N D k)
  (define (term i)
    (if (> i k)
        0
        (/ (N i) (+ (D i) (term (+ 1 i))))))
  (term 1))
;; This is a recursive procedure just because the last expression in the (term)
;; procedure is not tail recursion. There are other operation before
;; the procedure calls itself.

;; Now give the iterative procedure.
(define (cont-frac-iter N D k)
  (define (iteration i result)
    (if (< i 1)
        result
        (iteration (- i 1) (/ (N i) (+ (D i) result)))))
  (iteration k 0))
    
(define (approximation k)
  (define (good-enough? f1 f2)
    (let ((tolerance 0.0001))
      (< (abs (- (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) f1)
                 (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) f2)))
         tolerance)))
  (cond ((good-enough? k (+ k 1))
         (display (+ k 1))
         (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) (+ k 1)))
        (else (approximation (+ k 1)))))

(define cont-frac cont-frac-recur)
(approximation 5)

;; output
;;11
;Value: .6180555555555556
;; The output shows that it will take 11 steps to get 4 decimal places. (But it
;; just truncate the digits behind)
