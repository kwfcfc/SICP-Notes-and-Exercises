;; Demonstrate that the Carmichael numbers listed in Footnote 1.47: 51 really
;; do fool the Fermat test.

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else (remainder (* base (expmod base (- exp 1) m))
                         m))))
(define (Carmichael-number? n)
  (define (iteration-try test a)
    (cond ((= a 1) #t)
          ((not (= (expmod a test test) a)) #f)
          (else (iteration-try test (- a 1)))))
  (iteration-try n (- n 1)))

;; In Footnote 1.47: 51, there are 255 Carmichael numbers below 100,000,000.
;; Some smallest few are 561, 1105, 1729, 2465, 2821 and 6601.

(define (display-result procedure parameter)
  (display (procedure parameter))
  (newline)
  "done")

(display-result Carmichael-number? 561)
(display-result Carmichael-number? 1105)
(display-result Carmichael-number? 1729)
(display-result Carmichael-number? 2465)
(display-result Carmichael-number? 2821)
(display-result Carmichael-number? 6601)
