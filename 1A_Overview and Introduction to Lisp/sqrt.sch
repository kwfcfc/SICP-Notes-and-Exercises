(define (square x) (* x x))
(define (average x y) (/ (+ x y) 2))
(define (square_root x)
  (define good-enough (lambda (guess)
                        (< (abs (- (square guess) x)) 0.1)))
  (define improve (lambda (guess)
                    (average guess (/ x guess))))
  (define (try guess)
    (if (good-enough guess)
        guess
        (try (improve guess))))
  (try 1))

(square_root 25)
