;; a. Write a short paragraph explaining as clearly as you can how
;;   `partial-tree' works.  Draw the tree produced by `list->tree'
;;   for the list `(1 3 5 7 9 11)'.
;;
;; b. What is the order of growth in the number of steps required by
;;   `list->tree' to convert a list of n elements?

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

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


;; a. (let ((list1 '(1 3 5 7 9 11)))), the procedure (list->tree) first call
;;    (partial-tree list1 6). The partial-tree procedure returns cons of a
;;    balanced tree of first n elements of list and the rest of the list. First
;;    it calculates the middle points of the list, where the root entry should
;;    start. Then it do recursively get the left part of the whole balanced 
;;    tree, and the rest of list is (cdr left-result), of which the first 
;;    eleemnt is the middle point, and that element should be made as tree entry
;;    of. Finally, the right tree is the second to the end of the rest of list
;;    and the length is the subtraction of left and middle point. By recursion,
;;    we get the full balanced tree of the list.
;;b. The order of growth of this procedure is O(n). Each time the procedure
;;   reduce the scale of problem into two smaller procedure, say the length of
;;   (/ (- n 1) 2), so it is a n order because it approximately halved the
;;   procedure and produce two smaller ones. In general it returns O(n)
;;   order of growth.

