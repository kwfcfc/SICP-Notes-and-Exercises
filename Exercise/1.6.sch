(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (square x) (* x x))
(define (average x y) (/ (+ x y) 2))
(define (sqrt-iter guess x)
  (define (good-enuf? guess x)
     (< (abs (- x (square guess))) 0.01))
  (define (improve guess x)
     (average guess (/ x guess)))
  (new-if (good-enuf? guess x)
        guess
        (sqrt-iter (improve guess x)
                 x)))

(sqrt-iter 3 9)

;; It seems that the new-if will lead to void output.
;; Of course, the original if will function normally, and the output
;; is completely normal. Then I tried to use (cond (<p1> <e1>) (else <e2>))
;; instead of if, which means manually substitute new-if with cond expression,
;; and it worked completely fine. My explanation is that the intepreter is in
;; applicative order, which means it would first parse the argument before
;; expand the new-if operator. Therefore whether good-enuf? or not, the
;; iteration won't stop. 因为无论如何，迭代的部分总是要执行的。
