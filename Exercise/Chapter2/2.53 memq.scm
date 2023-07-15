(define (my-memq item x)
  (cond ((null? x) #f)
        ((eq? item (car x)) x)
        (else (my-memq item (cdr x)))))

(list 'a 'b 'c)

(list (list 'george))
(cdr '((x1 x2) (y1 y2)))

;; value (a b c)
;; value ((george))
;; value ((y1 y2))
(cadr '((x1 x2) (y1 y2)))
;; value (y1 y2)
(pair? (car '(a short list)))
;; value #f
(memq 'red '((red shoes) (blue socks)))
;; value #f

(memq 'red '(red shoes blue socks))
;; value (red shoes blue socks)

