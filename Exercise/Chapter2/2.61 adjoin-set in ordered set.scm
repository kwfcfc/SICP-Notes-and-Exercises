;; the set is ordered number set with smallest number in the beginning.

(define (adjoin-set x set)
  (cond ((< x (car set)) (con x set))
        ((= x (car set)) set)
        (else (con (car set) (adjoin-set x (cdr set))))))
