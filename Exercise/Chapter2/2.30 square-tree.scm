(define nil ())
(define (square x)
  (* x x))
;; Without using any higher-order procedure
(define (square-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

;; With using higher-order procedure
(define (square-tree-by-mapping tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree-by-mapping sub-tree)
             (square sub-tree)))
       tree))
