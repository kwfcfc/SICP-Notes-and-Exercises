#lang sicp
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

(define (make-leaf-set pairs)
  (let ((ordered (sort pairs)))
    (if (null? ordered)
      '()
      (let ((pair (car ordered)))
        (adjoin-set (make-leaf (car pair) ; symbol
                               (cadr pair)) ; frequency
                    (make-leaf-set (cdr ordered)))))))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

;; the encoded mesage should be a list of 1 and 0.
;; First we need to determine whether the symbol is in
;; the set or is the leaf
(define (encode-symbol sym tree)
  (cond ((not (element-of-set? sym (symbols tree)))
         (error "bad symbol -- ENCODE-SYMBOL" sym))
        ;; return nil, so if symbol fails to match in the tree, the message will be an error,
        ;; it can be left for others to decide how to handle the error
        ((leaf? tree) '())
        ;; matched the leaf, end the progress
        ((element-of-set? sym (symbols (left-branch tree)))
         (cons 0 (encode-symbol sym (left-branch tree))))
        (else (cons 1 (encode-symbol sym (right-branch tree))))))

(define (generate-huffman-tree pairs)
     (successive-merge (make-leaf-set pairs)))
  
;; let assume that the leaves set are ordered as from small
;; to large
(define (successive-merge leaves)
  (define (insert pair set)
    (cond ((null? set) (list pair))
          ((<= (weight pair) (weight (car set)))
           ;; the inserting pair is not greater than first element
           (cons pair set))
          (else (cons (car set) (insert pair (cdr set))))))
  (cond ((null? leaves) '())
        ((null? (cdr leaves))
         (car leaves))
        ;; only one leaf, or finally generate a huffman tree
        (else (let ((new-node (make-code-tree (car leaves) (cadr leaves)))
              ;;(let ((leaf1 (car leaves)) (leaf2 (cadr leaves))
                    (rest (cddr leaves)))
                (successive-merge
                 (insert new-node rest))))))
                         ;; remember, left branch often have weight no more than right branch

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
               (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit -- CHOOSE-BRANCH" bit))))

;; The following is example
(define frequency
  (list
   (list 'a 2)  (list 'Get 2) (list 'Sha 3) (list 'Wah 1)
   (list 'boom 1) (list 'job 2) (list 'na 16) (list 'yip 9)))

(define message (list 'Get 'a 'job
                 'Sha 'na 'na 'na 'na 'na 'na 'na
                 'Get 'a 'job
                 'Sha 'na 'na 'na 'na 'na 'na 'na
                 'Wah 'yip 'yip 'yip 'yip 'yip 'yip 'yip 'yip
                 'Sha 'boom))

;;(define sorted (sort frequency));; (lambda (x y) (< (weight x) (weight y)))))
;;sorted
(define htree (generate-huffman-tree frequency))
;;htree
(define coded (encode message htree))

(decode coded htree)

