;; If we allow duplicates of elements, it is easier to design adjoin-set

;; I don't find any efficency advantage to allow duplicates of sets
;; because it takes longer to search whether an element is in the
;; set.
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (con (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

;; For this two procedure, it is way more easier to use duplicates
;; representations.
(define (adjoin-set x set) (con x set))
(define (union-set set1 set2) (append set1 set2))

