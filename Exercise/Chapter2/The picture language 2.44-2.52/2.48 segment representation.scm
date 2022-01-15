(define make-segment cons)
;; actually it should be (cons vec1 vec2) but we
;; decide not to go deeper into the vector level,
;; that is we do not check the type of its container
(define start-segment car)
(define end-segment cdr)
