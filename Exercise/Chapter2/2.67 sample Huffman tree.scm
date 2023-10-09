;; *Exercise 2.67:* Define an encoding tree and a sample message:
;; 
;;      (define sample-tree
;;        (make-code-tree (make-leaf 'A 4)
;;                        (make-code-tree
;;                         (make-leaf 'B 2)
;;                         (make-code-tree (make-leaf 'D 1)
;;                                         (make-leaf 'C 1)))))
;; 
;;      (define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))
;; 
;; Use the `decode' procedure to decode the message, and give the
;; result.

(load "./huffman tree header.scm")

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

;; already defined in huffman tree header.scm
;;(define (make-leaf-set pairs)
;;  (if (null? pairs)
;;      '()
;;      (let ((pair (car pairs)))
;;        (adjoin-set (make-leaf (car pair)    ; symbol
;;                               (cadr pair))  ; frequency
;;                    (make-leaf-set (cdr pairs))))))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

