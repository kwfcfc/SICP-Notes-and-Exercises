;; Write a procedure that takes as inputs a procedure that computes f and
;; a positive integer n and returns the procedure that
;; computes the n th repeated application of f.

(define (compose f g) (lambda (x) (f (g x))))
(define (double f) (compose f f))
(define (repeated f n)
  (cond ((= n 1) (lambda (x) (f x)))
        ;; ((even? n) (compose (repeated f (/ n 2)) (repeated f (/ n 2))))
        ((even? n) (double (repeated f (/ n 2))))
        (else (compose (repeated f (- n 1)) f))))
;; The commented part will slow down the procedure because it will expand as
;; a tree with two branches, see exercise 1.26.

((repeated square 2) 5)

;; This one is from codology.net. Notice the complexity of this procedure
;; is O(n), while the upper is O(log n).
(define (repeated-straight f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))
