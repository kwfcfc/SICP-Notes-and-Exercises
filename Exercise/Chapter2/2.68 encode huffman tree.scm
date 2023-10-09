;; *Exercise 2.68:* The `encode' procedure takes as arguments a
;; message and a tree and produces the list of bits that gives the
;; encoded message.
;; 
;; `Encode-symbol' is a procedure, which you must write, that returns
;; the list of bits that encodes a given symbol according to a given
;; tree.  You should design `encode-symbol' so that it signals an
;; error if the symbol is not in the tree at all.  Test your
;; procedure by encoding the result you obtained in *Note Exercise
;; 2-67:: with the sample tree and seeing whether it is the same as
;; the original sample message.
;;#lang sicp

;;(load "./huffman tree header.scm")
;;(require "./huffman tree header.scm")

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

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
        ;; 
        ((leaf? tree) '())
        ;; matched the leaf, end the progress
        ((element-of-set? sym (symbols (left-branch tree)))
         (cons 0 (encode-symbol sym (left-branch tree))))
        (else (cons 1 (encode-symbol sym (right-branch tree))))))
