(define (same-parity x . z)
  (define (iter count con y);; y is the input pairs, con for condition    
    (cond ((and (con (car y)) (null? (cdr y)))
           (append count (list (car y))))
          ((null? (cdr y)) count)
          ((con (car y))
           (iter (append count
                      (list (car y)))
              con (cdr y)))
          (else
           (iter count con (cdr y)))))
  (define (filter r)
    (= (remainder r 2) (remainder x 2)))
  (iter (list x) filter z))

;; At first I was confused by the dotted-tail notation that I even thought the
;; inner procedure need to dotted-tail too. However it only deal with the input
;; by debugger. And the two condition iteration looks a little bit clumsy,
;; maybe there is more concise way. The key idea of inputting a list and
;; outputting a list as a function is to recursively cons the first part
;; processed and the rest part.
