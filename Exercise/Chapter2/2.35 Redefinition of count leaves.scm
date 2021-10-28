;; Redefinition of count-leaves
(define nil ())
(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))
(define (count-leaves tree)
  (accumulate + 0
              (map (lambda (x)
                     (if (not (pair? x)) 1
                         (count-leaves x)))
                   tree)))
;; This count-leaves will also take the nil that is not at the
;; end as leaves.
