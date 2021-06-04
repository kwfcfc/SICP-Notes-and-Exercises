;; Define a procedure double that takes a procedure of one argument as argument
;; and returns a procedure that applies the original procedure twice.
(define (double prxgr)
  (lambda (x) (prxgr (prxgr x))))

(define (inc x)
  (+ 1 x))
((double inc) 2)

(((double double) inc) 1)
;; The result of (double double) will result in a 4 calls of double. Therefore,
;; the result will be 8 (double). Substitute (double) with 2 (inc) will finally
;; return 16 inc. The result will be 21.
(((double (double double)) inc) 5)
