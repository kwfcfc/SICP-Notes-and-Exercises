;; *Exercise 2.69:* The following procedure takes as its argument a
;; list of symbol-frequency pairs (where no symbol appears in more
;; than one pair) and generates a Huffman encoding tree according to
;; the Huffman algorithm.
;;
;; `Make-leaf-set' is the procedure given above that transforms the
;; list of pairs into an ordered set of leaves.  `Successive-merge'
;; is the procedure you must write, using `make-code-tree' to
;; successively merge the smallest-weight elements of the set until
;; there is only one element left, which is the desired Huffman tree.
;; (This procedure is slightly tricky, but not really complicated.
;; If you find yourself designing a complex procedure, then you are
;; almost certainly doing something wrong.  You can take significant
;; advantage of the fact that we are using an ordered set
;; representation.)

#lang sicp
(load "./huffman tree header.scm")

(define (generate-huffman-tree pairs)
     (successive-merge (make-leaf-set pairs)))

;; let assume that the leaves set are ordered as from small
;; to large
(define (successive-merge leaves)
  (define (insert pair set)
    (cond ((null? set) (list pair))
          ((not (> (weight pair) (weight (car set))))
           ;; the inserting pair is not greater than first element
           (cons pair set))
          (else (cons (car set) (insert pair (cdr set))))))
  (cond ((null? leaves) '())
        ((null? (cdr leaves))
         (car leaves))
        ;; only one leaf, or finally generate a huffman tree
        (else (let ((new-node (make-code-tree (cadr leaves) (car leaves)))
              ;;(let ((leaf1 (car leaves)) (leaf2 (cadr leaves))
                    (rest (cddr leaves)))
                (successive-merge
                 (insert new-node rest))))))
                 ;;(insert (make-code-tree leaf2 leaf1) rest))))))
                         ;; remember, left branch often have weight no less than right branch
