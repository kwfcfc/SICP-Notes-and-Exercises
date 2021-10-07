;; Give combinations of cars and cdrs that will pick 7 from each of the
;; following lists

(1 3 (5 7) 9)
((7))
(1 (2 (3 (4 (5 (6 7))))))

(define l1 '(1 3 (5 7) 9) )
(define l2 '((7)) )
(define l3 '(1 (2 (3 (4 (5 (6 7)))))) )

(car (cdr (car (cdr (cdr l1)))))

(car (car l2))

(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr l3))))))))))))
