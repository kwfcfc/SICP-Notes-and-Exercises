;; Fill in the following template to produce a procedure that evaluates
;; a polynomial using Horner's rule
;; For example, to compute 1 + 3x + 5x3 + x5 at x = 2 you would evaluate
;; (horner-eval 2 (list 1 3 0 5 0 1))

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) <??>)
              0
              coefficient-sequence))

;; Here is the answer
(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                (+ this-coeff (* x higher-terms)))
              0
              coefficient-sequence))

