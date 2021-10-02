(define (last-pair l)
  (if (null? l)
      (display "empty list!")
      (if (null? (cdr l))
          (list (car l))
          (last-pair (cdr l)))))

