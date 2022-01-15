;; constructor and selectors
(define make-vect cons)
(define xcor-vect car)
(define ycor-vect cdr)

;; Operations
(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1) (xcor-vect v2))
             (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1) (xcor-vect v2))
             (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect s vect)
  (make-vect (* s (xcor-vect vect))
             (* s (ycor-vect vect))))
