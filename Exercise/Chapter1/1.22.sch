;; the prime test that has O(n) complexity
(define (prime? n)
  (define (smallest-divisor n)
    (define (find-divisor n test)
      (cond ((> (square test) n) n)
            ((divides? test n) test)
            (else (find-divisor n (+ 1 test)))))
    (define (divides? test n)
      (= (remainder n test) 0))
    (find-divisor n 2))
  (= n (smallest-divisor n)))

;; The runtime test procedure
(define (timed-prime-test n)
  (define (start-prime-test n start-time)
    (if (prime? n)
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

;; search for primes procedure
(define (search-for-prime start n)
  (cond ((= n 1) (timed-prime-test (find-prime start))
         (find-prime start))
        (else (timed-prime-test (find-prime start))
         (search-for-prime (next (find-prime start))
                                 (- n 1)))))

(define (next n)
  (if (even? n)
      (+ n 1)
      (+ n 2)))

(define (find-prime n)
  (if (prime? n)
      n
      (find-prime (next n))))

(search-for-prime 1000 3)
(search-for-prime 10000 3)
(search-for-prime 100000 3)

;; Respectively, each gives 3 prime number
;; 1009, 1013, 1019; 10007, 10009, 10037; 100003, 100019

;; Since my computer(and computer nowadays) is capable of handling much larger
;; numbers than 1980s(or even 2000s), the example on the book is not able to
;; show the O(sqrt(10)) growth. We need to find larger numbers. See 1.22.log.
;; for the output results the 1e9, 1e10 and 1e11. The time require
;; for 1e9, 1e10 and 1e11 is approximately 0.043, 0.133 and 0.406, satisfying
;; the sqrt(10) growth.(Of course the timing is not accurate,
;; error is unavoidable.
