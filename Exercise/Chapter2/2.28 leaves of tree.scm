(define (fringe tree)
  (cond ((null? tree) ())
        ((not (pair? (car tree)))
         (cons (car tree) (fringe (cdr tree))))
        (else (append (fringe (car tree)) (fringe (cdr tree))))))

;; you can also figure an iterative version.
;; This will give a deep understanding of recursion. First speculate the most
;; general operation expression by wishful thinking. Then think of those
;; special occasion. That is, the edge condition to stop the recursion. Most
;; general ones are those when an empty input is given. By the way, I found
;; there is no built-in procedure to tell whether a data is basic or compound
;; data(like (cons a b)), so I used a (not ) logical expression.

;; An alternative version is given later in the book which don't deal with the
;; (car tree) nonsense.
(define (fringe tree)
  (cond ((null? tree) ())
        ((not (pair? tree)) (list tree))
        (else (append (fringe (car tree))
                      (fringe (cdr tree))))))
