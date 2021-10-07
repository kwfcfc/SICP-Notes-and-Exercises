;; returns as its value the list with its elements reversed and with
;; all sublists deep-reversed as well.

(define (deep-reversed l)
  (define (iter items result)
    (cond ((null? items) result)
          (else (iter (cdr items)
                      (cons (if (list? (car items))
                                (deep-reversed (car items))
                                (car items))
                            result)))))
  (iter l ()))

;; Here you will find that to reverse the sublists of a list is similar to
;; exercise 2.22, as long as change the (answer <?>) procedure into (reverse <>)
;; procedure. However, to recall another (reverse <?> seems too dull, so here I
;; use an if expression to process the items, and so that it can be recursively
;; call the procedure itself.

;; notice the second condition pair? or list?, here is a example to
;; distinguish them.
(pair? (cons 1 (cons 2 3)))
(list? (cons 1 (cons 2 3)))

;; The result will respectively be #t, #f. Because the cdr of last cons
;; of a list is nil. A pair is anything that constructed by cons.
