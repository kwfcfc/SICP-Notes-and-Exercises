;; Use this to implement a simple procedure for computing n th roots
;; using fixed-point, average-damp, and the repeated procedure of
;; Exercise 1.43: 76.

;; the repeated procedure
(define (compose f g) (lambda (x) (f (g x))))
(define (double f) (compose f f))
(define (repeated f n)
  (cond ((= n 1) (lambda (x) (f x)))
        ((even? n) (double (repeated f (/ n 2))))
        (else (compose (repeated f (- n 1)) f))))

;; the average-damp procedure
(define (average x y)
  (/ (+ x y) 2))
(define (average-damp f)
  (lambda(x) (average (f x) x)))

;; the fixed-point procedure
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? next guess)
          next
          (try next))))
  (try first-guess))

(define (test-root-nth x n k)
  (define (expt a b)
    (exp (* (log a) b)))
;; Here the exponetion procedure can be defined in other way, see more
;; at 1.2.4 Exponentiation.
  (fixed-point ((repeated average-damp k) (lambda (y)
                                            (/ x (expt y (- n 1)))))
               1))

;; After several experiments, it seems that the as long as 2^k >= n,
;; the average damping will converge.

(define (root-nth x n)
  (test-root-nth x n ((lambda (i) (floor (/ (log n) (log 2)))) n)))
