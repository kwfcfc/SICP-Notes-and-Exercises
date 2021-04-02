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

;; The 
