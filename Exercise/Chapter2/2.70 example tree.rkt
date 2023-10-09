#lang sicp

(load "./huffman tree header.scm")
(load "./2.68 encode huffman tree.scm")
(load "./2.69 successive-merge.scm")
(load "./2.67 sample Huffman tree.scm")

(define frequency
  (list
   (list 'a 2) (list 'Get 2) (list 'Sha 3) (list 'Wah 1)
   (list 'boom 1) (list 'job 2) (list 'na 16) (list 'yip 9)))

;;(sort frequency (lambda (x y) (< (cadr x) (cadr y))))

(define message ('Get 'a 'job
                 'Sha 'na 'na 'na 'na 'na 'na 'na
                 'Get 'a 'job
                 'Sha 'na 'na 'na 'na 'na 'na 'na
                 'Wah 'yip 'yip 'yip 'yip 'yip 'yip 'yip 'yip
                 'Sha 'boom))

(encode message (generate-huffman-tree frequency))
