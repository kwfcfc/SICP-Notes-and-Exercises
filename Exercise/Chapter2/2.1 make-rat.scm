;;  Define a beer version of make-rat that handles both positive and
;; negative arguments.

;; The previous (make-rat) procedure, without reducing to lowest terms.
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (< d 0)
        (cons (- 0 (/ n g)) (- 0 (/ d g)))
        (cons (/ n g) (/ d g)))))

;; We don't need to care about the sign of numerator since we only need to
;; guarantee that denominator is positive.
;; However, notice that how will gcd deal with negative numbers, here
;; the primitive procedure will always return positive value.
(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(print-rat (make-rat -4 9))
(print-rat (make-rat 4 -9))
(print-rat (make-rat 6 -9))
(print-rat (make-rat -25 -100))
