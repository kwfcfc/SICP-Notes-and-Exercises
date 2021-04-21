;; Design a procedure that evolves an iterative
;; exponentiation process that uses successive
;; squaring and uses a logrithmic number of steps,
;; as does fast-expt.
(define (recursive-fast-expt b n)
   (define (even? n)
   (= (remainder n 2) 0))
   (cond ((= n 0) 1)
   ((even? n) (square (fast-expt b (/ n 2))))
   (else (* b (fast-expt b (- n 1))))))

;; Here I try to answer the question.
(define (iterative-fast-expt b n)
  (define (even? n)
    (= (remainder n 2) 0))
  (define (iter-expt a b n)
    (cond ((= 0 n) a)
          ((even? n) (iter-expt a
                                ;; here should not square the a, remember that the initial value of a is 1.
                                ;; keep a*b^n as a constant.
                                (* b b)
                                (/ n 2)))
          (else (iter-expt (* a b)
                           b
                           (- n 1)))))
  (iter-expt 1 b n))

(iterative-fast-expt 3 2)
