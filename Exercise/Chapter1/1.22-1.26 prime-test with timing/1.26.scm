;; Louis Reasoner is having great difficulty doing Exercise 1.24: 53.
;; His fast-prime? test seems to run more slowly than his prime? test.

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base
                       (expmod base (- exp 1) m))
                    m))))

;; “By writing the procedure like that, you have transformed the Θ(log n)
;; process into a Θ(n) process.” Explain.


;; The difference between Louis Reasoner's procedure and the procedure in the
;; book is that Louis Reasoner use a multiplication instead of (square)

;; See this part
(* (expmod base (/ exp 2) m)
   (expmod base (/ exp 2) m))
;; It will expand as a tree with two branches. The evaluation of (*) will be put
;; after the evaluation of (expmod). A tree with 2 branches is clearly the
;; complexity of O(2^n), because it is recursive calel.
;; The deduction of (expmod) is O(log n). And the O(log (2^n)) is the complexity
;; of O(n).
(square (expmod base (/ exp 2) m))
;; Here a procedure (square) will only deal with the returned value of procedure
;; (expmod), which only does not need to wait the tree recursion.
