;; Scheme standardly provides a map procedure that is more general than
;; the one described here. This more general map takes a procedure of n
;; arguments, together with n lists, and applies the procedure to all the first
;; elements of the lists, all the second elements of the lists, and so on,
;; returning a list of the results.
(define (dot-product v w)
  (accumulate + 0 (map * v w)))

;; Fill in the missing expressions in the following procedures for computing
;; the other matrix operations
(define (matrix-*-vector m v)
  (map <??> m))
(define (transpose mat)
  (accumulate-n <??> <??> mat))
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map <??> m)))

;; Here are answers
(load "./2.36 accumulate-n.scm")
;; to load in the accumulate-n for this procedure
(define (vector-mul v1 v2)
  (accumulate + 0 (map * v1 v2)))
(define (matrix-*-vector m v)
  (map (lambda (x) (vector-mul v x)) m))
(define (transpose mat)
  (accumulate-n cons nil mat))
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x)
           (map (lambda (y) (vector-mul x y)) cols))
         m)))
;; it's actually limited by lambda expressions
;; that (map <?> <?>) is capable to deal with
;; multiple arugments.
