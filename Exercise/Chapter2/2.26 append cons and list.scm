(define x (list 1 2 3))
(define y (list 4 5 6))

;; Evaluate three expression
(append x y)
(cons x y)
(list x y)

;; Value: (1 2 3 4 5 6)
;; Value: ((1 2 3) 4 5 6)
;; Value: ((1 2 3) (4 5 6))

;; The second expression is because every list (as a cons string) will end by
;; a nil, that separates a list. That's why when evaluating (cons x y)
;; will have x in a parentheses but y can be connected to the list easily.
