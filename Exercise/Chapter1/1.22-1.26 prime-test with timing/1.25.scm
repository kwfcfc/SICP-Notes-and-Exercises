;; The fast-expt pricedure
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

;; Alyssa P. Hacker's procedure
(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

;;expand (remainder (fast-expt base exp) m)
(remainder (cond ((= exp 0) 1)
                 ((even? n) (square (fast-expt base (/ exp 2))))
                 (else (* base (fast-expt base (- exp 1)))))
           m)
;; Compared to 1.25 backup.scm, it seems that the order of (cond) procedure
;; and (remainder) procedures matters a lot. The (fast-expt) procedure's order
;; is first remainder and then (cond) However the backup code is first (cond)
;; and then (remainder). Of course to glance at the procedure we will know
;; that the exponential calculation grows surprisingly fast. We know the
;; calculating order is important.
;; My explanation is that Alyssa P.Hacker's procedure will run too slowly
;; because complexity of calculating large exponential number is high.
;; And procedure 2 will decrease the scale of exponential number.

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
