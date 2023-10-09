;; the union of two set is that the element is either in set A, set B or both.
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (union-set set1 set2)
  (cond ((and (null? set1) (null? set2)) '())
        ((null? set1) set2)
        ((null? set2) set1)
        ((element-of-set? (car set1) set2)
         (union-set (cdr set1) set2)) ;; means (car set1) is the also in the set2
        (else (con (car set1) (union-set (cdr set1) set2)))))
         ;; add the (car set1) into the union set
