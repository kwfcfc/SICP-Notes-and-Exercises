;;a. Do the two procedures produce the same result for every tree?
;;   If not, how do the results differ?  What lists do the two
;;   procedures produce for the trees in *Note Figure 2-16::?
;;
;;b. Do the two procedures have the same order of growth in the
;;   number of steps required to convert a balanced tree with n
;;   elements to a list?  If not, which one grows more slowly?

(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

(define tree1 (make-tree 4
                         (make-tree 2
                                    (make-tree 1 '() '()) '())
                         (make-tree 5
                                    (make-tree 3 '() '())
                                    (make-tree 7 '() '()))))
(define tree2 (make-tree 3
                         (make-tree 1
                                    '() '())
                         (make-tree 7
                                    (make-tree 5 '() '())
                                    (make-tree 9 '()
                                               (make-tree 11 '() '())))))
(define tree3 (make-tree 5
                         (make-tree 3
                                    (make-tree 1 '() '()) '())
                         (make-tree 9
                                    (make-tree 7 '() '())
                                    (make-tree 11 '() '()))))
;; both function give the same result (1 3 5 7 9 11)
;; Both function have the same order of growth, tree->list-1 call two sub
;; processes for two branches and do some operations (append and cons), so the
;; order of growth is approximately O(n), because it operates n times for a tree
;; with n elements. Tree->list-2 applies the same, it also calls two functions
;; copy-to-list and recursively do some operations (copy-to-list and cons)
