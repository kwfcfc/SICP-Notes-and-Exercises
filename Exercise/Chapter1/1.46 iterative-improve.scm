;; Write a procedure iterative-improve that takes two procedures as arguments:
;; a method for telling whether a guess is good enough and a method
;; for improving a guess. iterative-improve should return as its value
;; a procedure that takes a guess as argument and keeps improving the guess
;; until it is good enough.
(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve guess))))
  (lambda (x) (iter x)))

;; rewrite sqrt procedure using iterative-improve.
(define (average x y) (/ (+ x y) 2))
(define (sqrt x)
  (define (improve guess) (average guess (/ x guess)))
  (define (good-enough? guess)
    (< (abs (- (square guess) x))
       0.001))
  ((iterative-improve good-enough? improve) 1.0))

;; rewrite fixed-point with iterative-improve
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? guess)
    (< (abs (- (f guess) guess)) tolerance))
  (define (improve guess) (f guess))
  ((iterative-improve close-enough? improve) first-guess))

(define (average-damp f) (lambda(x) (average (f x) x)))
(define (sqrt-fixed-damped n)
  (fixed-point (average-damp (lambda(x) (/ n x)))
               2.0))

(sqrt 4)
(sqrt-fixed-damped 4)
