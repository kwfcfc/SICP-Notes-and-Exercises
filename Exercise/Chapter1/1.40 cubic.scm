;; Define a procedure cubic to approximate zeros of
;; the cubic x 3 + ax 2 + bx + c

;; The fixed-point procedure
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? next guess)
          next
          (try next))))
  (try first-guess))

;; The Newton's Method
(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))
(define dx 0.00001)
(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

;; cubic procedure
(define (cubic a b c)
  (define (cubic-power x) (* x x x))
  (define (square x) (* x x))
  (lambda(x) (+ (cubic-power x) (* a (square x)) (* b x) c)))

(define (solve-equation a b c)
  (newtons-method (cubic a b c) 1))
