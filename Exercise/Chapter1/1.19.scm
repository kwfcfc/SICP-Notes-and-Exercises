;; Question 1.19
;; The key to this question, is the transformation T.
;; In a mathematical point of view, it is just a matrix.
;; Of course, since here we only need to find T^2,
;; there is no need working out the engine values and the engine vectors.
;; Just simply multiply itself and thus get the answer.
;; This question is a little bit easier than
;; several questions before, because it just another
;; application of O(log n) complexity algorithm.

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* q q) (* p p)) ; compute p ′
                   (+ (* q q) (* 2 p q)) ; compute q ′
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(fib 9)
