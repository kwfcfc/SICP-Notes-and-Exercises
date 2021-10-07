(define (fringe tree)
  (cond ((null? tree) ())
        ((null? (car tree)) (cons () (fringe (cdr tree))))
        ((not (pair? (car tree))) (cons (car tree) (fringe (cdr tree))))
        (else (append (fringe (car tree)) (fringe (cdr tree))))))

;; This will give a deep understanding of recursion. First speculate the most
;; general operation expression by wishful thinking. Then think of those
;; special occasion. That is, the edge condition to stop the recursion. Most
;; general ones are those when an empty input is given. By the way, I found
;; there is no built-in procedure to tell whether a data is basic or compound
;; data(like (cons a b)), so I used a (not ) logical expression.
