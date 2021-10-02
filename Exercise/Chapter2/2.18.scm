(define (reverse l)
  (if (null? (cdr l))
      (list (car l))
      (append (reverse (cdr l))
              (list (car l)))))

;; an iterative solution
(define (reverse l)
  (define (iter items result)
    (if (null? items)
        result
        (item (cdr items)
              (cons (car items) result))))
  (iter l ()))
              
  
;; The reason that the if predicate checks whether the (cdr l) is null is we
;; assume that it is a nonempty list. So we don't check the l itself.
;; At first, I was about to use (list <arg>) or (cons <arg>) to connect
;; recursive part and the (car l), but it will bring about unnecessary level of
;; structure. So (append <arg> <arg>) is acceptable.
