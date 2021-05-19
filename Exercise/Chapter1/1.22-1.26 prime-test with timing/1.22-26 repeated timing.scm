;; This snippet of code is intended to compute the runtime(real-time-clock)
;; of a procedure. First, to count the runtime of a procedure. Then, repeat it
;; for a given n times. And then average them.

(define (repeat-test n times);; n is the scale of input, times is repeated times)
  (define (one-count n start-time)
    (if (prime? n)
        (- (runtime) start-time)
        "not prime"))
  (if (= 0 times)
      0
      (/ (+ (one-count n (real-time-clock))
            (* (- times 1)
               (repeat-test n (- times 1))))
         times)))

;; Below are the prime? procedure
(define (next n)
  (if (= n 2)
      3
      (+ n 2)))
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

(repeat-test 1000000007 1000)
