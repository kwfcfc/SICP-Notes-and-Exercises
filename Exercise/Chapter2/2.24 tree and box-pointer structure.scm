(list 1 (list 2 (list 3 4)))

;; Value (1 (2 (3 4)))

(cons 1 (cons
         (cons 2
               (cons
                 (cons 3
                       (cons 4 ()))
                 ()))
         ()))
;; This is equivalent form constructed by cons
;; The other two kinds of form are not easy to illustrate on text-base file.
;; But it's kind of easy.
