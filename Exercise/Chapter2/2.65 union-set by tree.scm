;;*Exercise 2.65:* Use the results of *Note Exercise 2-63:: and
;; *Note Exercise 2-64:: to give [theta](n) implementations of
;; `union-set' and `intersection-set' for sets implemented as
;; (balanced) binary trees.(5)

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right) (list entry left right))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

;; remove duplicate elemet from a list in order to make a set
(define (list->set list)
  (define (copy-set lst result)
    (cond ((null? lst) result)
          ((element-of-set? (car lst) result)
           (copy-set (cdr lst) result))
          (else (copy-set (cdr lst) (cons (car lst) result)))))
  (copy-set list '()))

(define (list->tree elements)
  (define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))
  (car (partial-tree elements (length elements))))

;; We assume that these are two balanced trees.
(define (union-set tree1 tree2)
  (cond ((null? tree1) tree2)
        ((null? tree2) tree1)
        (else
         (let (unbalanced-tree
               (make-tree (entry tree1)
                          (union-set (left-branch tree1) tree2)
                          (union-set (right-branch tree1) tree2)))
           (list->tree (list->set (tree->list unbalanced-tree)))))))
;; make the unbalanced tree into balanced one

(define (intersection-set tree1 tree2)
  (cond ((or (null? tree1) (null? tree2)) '())
        ((equal? (entry tree1) (entry tree2))
         (make-tree (entry tree1)
                    ;; a better solution is to break down into a smaller tree
                    ;; and give 
                    (intersection-set tree1 (left-branch tree2))
                    (intersection-set tree1 (right-branch tree2))))))

