;; Write a procedure smooth that takes as input a procedure that computes f and
;; returns a procedure that computes the smoothed f..

;; Here is the repeated procedure from 1.43.
(define (repeated f n)
  (define (double f) (compose f f))
  (define (compose f g) (lambda (x) (f (g x))))
  (cond ((= n 1) (lambda (x) (f x)))
        ((even? n) (double (repeated f (/ n 2))))
        (else (compose (repeated f (- n 1)) f))))

(define dx 0.00001)
(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) (f x)
                    (f (+ x dx)))
                 3)))
                 
(define (smooth-nth f n)
  ((repeated smooth n) f))
