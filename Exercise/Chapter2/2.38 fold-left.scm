(define nil ())

;; The accumulate procedure, known as fold-right.
(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))
;; This procedure will first operate its right part.
;; (in its recursive version.

;; This is called fold-left procedure
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))
;; operate the list from left(car) to right
;; sort of iteration

;;(fold-right / 1 (list 1 2 3))
;;(fold-left / 1 (list 1 2 3))
;;(fold-right list nil (list 1 2 3))
;;(fold-left list nil (list 1 2 3))

;;Value:
;;3/2
;;1/6
;;(1 (2 (3 ())))
;;(((() 1) 2) 3)

;; for any proc of two arguments (proc a b)
;;  (eq? (fold-left proc initial sequence)
;;       (fold-right proc initial sequence))
;;   if and only if
;;  (eq? (proc a b)
;;       (proc b a))
;; for a sequence
;; (list a b)
;; the value of fold-left
;;(fold-left proc a (list b))
;;(proc a b)

;;(fold-right proc a (list b))
;;(proc b a)

;; So proc must have such property that
;; (eq? (proc a b) (proc b a))
;; for any list that is more than 1 element,
;; it's just a matter of cons procedure.

;;(fold-left proc initial (list a b))
;;value
;;(proc (proc initial a) b)

;;(fold-right proc initial (list a b))
;;(proc a (proc b initial))
            
