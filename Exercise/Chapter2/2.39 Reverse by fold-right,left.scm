(load "./2.38 fold-left.scm")

(define (reverse-right sequence)
  (fold-right (lambda (x y)
                (fold-right cons (cons x nil) y))
              nil
              sequence))

;;e.g. (reverse-right (list 1 2))
;; (proc (proc 2 nil) 1)
;; (cons 2 (cons 1 nil))

(define (reverse-left sequence)
  (fold-left (lambda (x y) (cons y x))
              nil
              sequence))

(define (operate x y)
  (cond ((null? y) x)
        ((pair? y) (append y (list x)))
        (else (list y x))))

;; The append is also a recursive procedure, but this is
;; also some procedure out of the abstract level
;; In point of view of accumulate (or list processing)
;; what we need is a procedure that takes a value and a
;; list, and put the value in the right of the list. We
;; going to implement this by (fold-right op initial seq)
(define (push value sequence)
  (fold-right cons (cons value nil) sequence))
