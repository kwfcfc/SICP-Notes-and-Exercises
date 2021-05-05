 (define (cube-root x y) ;; y as the guess number
  (define (good-enuf? x y)
    (< (abs (- (* y y y) x)) ;; the absolute value of the substraction of cube y and x
       (* 0.01 x)))
  (define (improve x y)
                    (/ (+ (/ x (* y y))
                          (* 2 y))
                       3))
(define (iter-cube x y)
  (if (good-enuf? x y)
      y
      (iter-cube x (/ (+ (/ x (* y y))
                         (* 2 y))
                      3))))
(iter-cube x y))

(cube-root 81 4)

;; This exercise just extend the square root procedure into cubic root.
;; At first, I was confused by the iteration part.
;; I defined a iteration subprocedure and it doesn't function.
;; But later I found the error. The main procedure doesn't define any return.
;; I just defined the procedure but didn't use it.
;; Next time, I will make myself clearly aware of the definition part and the main procedure part. 
