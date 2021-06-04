;; Here I am going to use the proof in exercise 1.13.
;; 𝜑 = (1+√5)/2. So we need to compute (1+1/x), which happens to equal to
;; (1+√5)/2. Therefore 𝜑 is a fixed-point of f(x)=1+ 1/x.

;; Use the fact that the golden ratio 𝜑 is the fixed-point of the transformation
;; x -> 1+ 1/x, to compute it by means of fixed-point procedure.
;; Here is the fixed-point procedure

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

;; Now compute the 𝜑.
(fixed-point (lambda(x) (+ 1 (/ 1 x)))
             1.0)
