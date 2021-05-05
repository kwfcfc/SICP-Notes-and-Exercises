;; Ackermann's function
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

;; Use the substitution
(A 1 10)
(A 0 (A 1 9))
(A 0 (A 0 (A 1 8)))
(A 0 (A 0 (A 0 (A 1 7)))), etc

;; By some deductions, we can guess that (A 1 n) = 2^n
;; Therefore, (A 1 10)=1024, which is  2^10.

(A 2 4)
(A 1 (A 2 3))
(A 1 (A 1 (A 2 2)))
(A 1 (A 1 (A 1 (A 2 1))))
(A 1 (A 1 (A 1 2)))
(A 1 (A 1 4))
(A 1 16)
2^16, which is 65536

(A 3 3)
(A 2 (A 3 2))
(A 2 (A 2 (A 3 1)))
(A 2 (A 2 2))
(A 2 (A 1 (A 2 1)))
(A 2 (A 1 2))
(A 2 4)
2^16, which is also 65536.

;; (f n) computes 2n
;; (g n) computes 2^n
;; (h n) computes 2^……^2, with (n-1) "^" in it.
;; another way to express it, (h n) = 2^(h (- n 1))

