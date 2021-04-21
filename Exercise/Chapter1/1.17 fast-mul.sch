;; Fast multiplication analagous to fast exponentiation.
;; There are four primitive procedures
;; plus, substract, double and halve.

;; The recursive procedure (only for demonstration)
(define (mul a b)
   (if (= b 0)
       0
       (+ a (mul a (- b 1)))))

;; The answer
(define (double a)
  (* a 2))
(define (halve a)
  (/ a 2))
(define (even? n)
  (= (remainder n 2) 0))
(define (fast-mult a b)
  (define (multiple-iter a b s)
    (if (even? b)
        (multiple-iter (double a) (halve b) s)
        (multiple-iter a (- b 1) (+ a s))))
  (multiple-iter a b 0))
;;  (cond ((or (= b 0) (= a 0)) 0)
;;        ((even? b) (fast-mult (double a) (halve b)))
;;        (else (+ a (fast-mult a (- b 1))))))

(fast-mult 10 2)
  

