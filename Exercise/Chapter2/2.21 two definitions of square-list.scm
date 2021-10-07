;; Here are two different definitions of square-list. Complete both
;; of them by filling in the missing expressions:
(define nil ())

(define (square-list items)
  (if (null? items)
      nil
      (cons
       ⟨??⟩ ⟨??⟩)))
;; The answer is
(cons (square (car items))
      (square-list (cdr items)))

;; Here is the definition of map procedure
(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items))))

(define (square-list items)
  (map
   ⟨??⟩ ⟨??⟩))

;; Here is the answer
(map (lambda (x) (* x x))
     items)
