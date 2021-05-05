;; This part will define a next procedure instead of simply (+ 1 <?>) to reduce
;; the redundant steps of even numbers.
(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

;; Actually I've done this part in exercise 1.22.sch(The next procedure)

;; prime? procedure
(define (prime? n)
  (define (smallest-divisor n)
    (define (find-divisor n test)
      (cond ((> (square test) n) n)
            ((divides? test n) test)
            (else (find-divisor n (next test)))))
    (define (divides? test n)
      (= (remainder n test) 0))
    (find-divisor n 2))
  (= n (smallest-divisor n)))

;; The time procedure
(define (timed-prime-test n)
(newline)
(display n)
(start-prime-test n (runtime)))
(define (start-prime-test n start-time)
(if (prime? n)
(report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
(display " *** ")
(display elapsed-time))

;; The search-for-prime procedure
(define (search-for-prime start n)
  (cond ((= n 1) (timed-prime-test (find-prime start))
         (find-prime start))
        (else (timed-prime-test (find-prime start))
         (search-for-prime (next (find-prime start))
                                 (- n 1)))))

;; The find-prime procedure
(define (find-prime n)
  (if (prime? n)
      n
      (find-prime (next n))))
;; now test the 12 prime numbers.
(timed-prime-test 1009)
(timed-prime-test 1013)
(timed-prime-test 1019)
(timed-prime-test 10007)
(timed-prime-test 10009)
(timed-prime-test 10037)
(timed-prime-test 100003) 
(timed-prime-test 100019)
(timed-prime-test 100043)
(timed-prime-test 1000000007)
(timed-prime-test 1000000009)
(timed-prime-test 1000000021)
(timed-prime-test 10000000019)
(timed-prime-test 10000000033)
(timed-prime-test 10000000061)
(timed-prime-test 100000000003)
(timed-prime-test 100000000019)
(timed-prime-test 100000000057)
(timed-prime-test 1000000000039)
(timed-prime-test 1000000000061)
(timed-prime-test 1000000000063)
