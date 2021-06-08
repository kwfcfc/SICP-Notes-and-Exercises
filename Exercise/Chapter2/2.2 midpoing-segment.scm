;; Define a constructor make-segment and selectors start-segment and end-segment
;; that define the representation of segments in terms of points. Accordingly,
;; specify a constructor make-point and selectors x-point and y-point that
;; define this representation. Finally, using your selectors and constructors,
;; define a procedure midpoint-segment that takes a line segment as argument
;; and returns its mid-point

(define (average x y) (/ (+ x y) 2))
(define make-point cons)
(define x-point car)
(define y-point cdr)
(define make-segment cons)
(define start-segment car)
(define end-segment cdr)
;; Here I think the difference is subtle between directly renaming the cons
;; into make-point and calling a procedure cons. Maybe in the process of
;; debugging, the latter will be easier to trace.
;; In the following exercise, I may not use cons directly by aliasing it
;; into the specific procedure I am dealing with, because it does not meet
;; the requirement of abstraction barriers
(define (midpoint-segment p)
  (make-point (average (x-point (start-segment p)) (x-point (end-segment p)))
              (average (y-point (start-segment p)) (y-point (end-segment p)))))

;; print-point procedure
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;; test
(define dot-a (make-point 3 4))
(define dot-b (make-point 7 6))
(define segment-l (make-segment dot-a dot-b))

(print-point (midpoint-segment segment-l))
