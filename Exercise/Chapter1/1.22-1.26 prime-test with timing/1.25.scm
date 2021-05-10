;; The fast-expt pricedure
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

;; Alyssa P. Hacker's procedure
(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

;; The modified timed-prime-test procedure
(define (timed-prime-test n)
  (define (start-prime-test n start-time)
    (if (fast-prime? n 100)
        (report-prime (- (runtime) start-time));; Notice here if it is normal
        ;; application, it will return 0.
        "nothing"));; this part is from codology.net
  ;; And I think it is reasonable, because the timed-prime-procedure itself
  ;; needs to be safely run by outer process.
  (define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))
  (newline)
  (display n)
  (start-prime-test n (runtime)))

;; Notice that here it only computes 100 times.
(timed-prime-test 1019)
(timed-prime-test 10037)
(timed-prime-test 100043)
(timed-prime-test 1000037)
;; For now the output seems quite different from 1.24, the old fast-prime?
;; procedure. It seems while the fast-prime? only increase slowly as n grows,
;; the 1.25 fast-expt? increases faster than n^2.
;; Alyssa P.Hacker's procedure won't serve as fast as the fast prime procedure.

;; Reason:
