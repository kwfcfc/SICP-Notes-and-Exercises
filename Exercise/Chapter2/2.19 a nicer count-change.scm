(define uk-coins (list 50 25 10 5 1))
(define us-coins (list 100 50 20 10 5 2 1 0.5))
(define cn-changes (list 50 20 10 5 1))

;; The main procedures from the book
(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination
                 coin-values))
            (cc (- amount
                   (first-denomination
                    coin-values))
                coin-values)))))

;; Now define no-more? procedure
(define no-more? null?)

;; Now define except-first-denomination procedure
(define except-first-denomination cdr)

;; Now define first-denomination procedure
(define first-denomination car)

;; The order of list won't affect the answer, because all the possible
;; combination will be used. But the speed will be affected since it's a
;; recursive procedure and may have done some redundant work.
