;;#lang sicp
;; it's like the idea in c #include which simply add them into the front of code

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))

(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))
(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

;; (define (sort lst proc) ;; a dumb insert sort
(define (sort lst)
  (define (insert-element element sorted)
    ;; insert one element
    (cond ((null? sorted) (list element))
          ;;((proc element (car sorted)) (cons element sorted))
          ((< (cadr element) (cadr (car sorted))) (cons element sorted))
          (else (cons (car sorted) (insert-element element (cdr sorted))))))
  (define (generate-sorted unsorted sorted)
    ;; sort unsorted list one by one into sorted list
    (if (null? unsorted)
        sorted
        (generate-sorted (cdr unsorted) (insert-element (car unsorted) sorted))))
  (generate-sorted lst '()))

;; make ordered leaf set
(define (make-leaf-set pairs)
  (let ((ordered (sort pairs)))
    (if (null? ordered)
      '()
      (let ((pair (car ordered)))
        (adjoin-set (make-leaf (car pair) ; symbol
                               (cadr pair)) ; frequency
                    (make-leaf-set (cdr ordered)))))))

(define (make-leaf-set-recursive pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)    ; symbol
                               (cadr pair))  ; frequency
                    (make-leaf-set (cdr pairs))))))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))
