(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

;; Defining square-list this way produces the answer
;; list in the reverse order of the one desired.
;; The second doesn’t work either.

;; Explanation
;; The first procedure will produce a result like
(cons last-processed
      (cons ...
            (cons ... (cons second-processed
                            (cons first-processed nil)))))

;; Because in the pair two objects are not constructed in "equal level",
;; need to unwrap them.

;; The second procedure will produce such a result:
(cons
 (cons
  (cons (cons (cons nil first-processed) second-processed) ...) ...)
 last-processed)
 
 ;; If removed the square procedure, it is the same as the reverse procedure
