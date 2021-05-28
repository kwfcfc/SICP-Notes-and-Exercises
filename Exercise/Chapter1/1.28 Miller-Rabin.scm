(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((and (= (remainder (square base) m) 1)
              (not (or (= base 1)
                       (= base (- m 1))))) 0)
;; The test part could be rewrite into a function.
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

;; I actually doubt whehter it is proper to insert the check-test of nontrival squareroot of 1 modulo n into the (expmod)
(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (miller-rabin-prime? n times)
  (cond ((= times 0) "prime")
        ((miller-rabin-test n) (miller-rabin-prime? n (- times 1)))
        (else "not prime")))

(miller-rabin-prime? 2 10)
(miller-rabin-prime? 10037 10)
(miller-rabin-prime? 100043 10)
(miller-rabin-prime? 1009 10)
(miller-rabin-prime? 99 10)
(miller-rabin-prime? 4 10)
(miller-rabin-prime? 108 10)
(miller-rabin-prime? 10039 10)
