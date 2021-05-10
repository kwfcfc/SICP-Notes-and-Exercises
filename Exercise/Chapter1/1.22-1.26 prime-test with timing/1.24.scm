;; The fast-prime part(Fermat Method)
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

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
    (if (fast-prime? n 1000)
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

;; It computes 1000 times.
(timed-prime-test 1019)
(timed-prime-test 10037)
(timed-prime-test 100043)
(timed-prime-test 1000037)

(timed-prime-test 1000000007)
(timed-prime-test 1000000009)
(timed-prime-test 1000000021)
(timed-prime-test 10000000019)
(timed-prime-test 10000000061)
(timed-prime-test 100000000003)
(timed-prime-test 1000000000039)
(timed-prime-test 1000000000063)
