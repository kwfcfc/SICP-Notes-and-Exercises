;; In order to deal with such a data structure, we need to redesgin the make-sum
;; procedure and its selector

(load "./2.58 infix form.a.scm")
;; rechain is used to extend two arguments procedure into
;; several more, if possible.
(define (rechain func lst)
  (cond ((null? lst) 0)
        ((= (length lst) 1) (car lst))
        (else
         (func (car lst) (rechain func (cdr lst))))))


(define (make-sum-n a1 a2)
  (define (higher-operator? a)
    ;; this is a list containing those operators that have higher order than
    ;; addition. It is used for parenthesses, for now there are only addition
    ;; and multiplication.
    (or (sum? a) (product? a)))
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        ;; now it will deal with the multiplication
        ;; in addition e.g. (a + 3 * b + 4)
        ((and (higher-operator? a1) (higher-operator? a2))
         (append a1 (list '+) a2))
        ((higher-operator? a1)
         (append a1 (list '+ a2)))
        ((higher-operator? a2)
         (append (list a1 '+) a2))
        (else (list a1 '+ a2))))

;; further simplification of numbers may need post operations
(define (make-sums . z)
  (rechain make-sum-n z))

;; Debugging

(define (make-product-n m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        ((and (product? m1) (product? m2))
         (append m1 (list '*) m2))
        ((product? m1)
         (append m1 (list '* m2)))
        ((product? m2)
         (append (list m1 '*) m2))
        (else (list m1 '* m2))))

(define (make-products . z)
  (rechain make-product-n z))

;; This procedure cannot deal with the simplification of numerical items.
;; However, this is passed to the procedure in exercise 2.57 (George in
;; that procedure).
