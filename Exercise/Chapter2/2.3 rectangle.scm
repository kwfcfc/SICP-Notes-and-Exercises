;; Implement a representation for rectangles in a plane.

;; abstraction barriers level of points
(define (average x y) (/ (+ x y) 2))
(define make-point cons)
(define x-point car)
(define y-point cdr)
(define (distance p1 p2)
  (sqrt (+ (square (- (x-point p1) (x-point p2)))
           (square (- (y-point p1) (y-point p2))))))
(define (sub-point p1 p2)
  (make-point (- (x-point p1) (x-point p2))
              (- (y-point p1) (y-point p2))))

;; abstraction barriers level of lines.
(define make-segment cons)
(define start-segment car)
(define end-segment cdr)
(define (length-of-segment p) (distance start-segment end-segment))
(define (vector-mul l1 l2)
  (define (vec-mul p1 p2)
    (+ (* (x-point p1) (x-point p2)) (* (y-point p1) (y-point p2))))
  (- (+ (vec-mul (start-segment l1) (start-segment l2))
        (vec-mul (end-segment l1) (end-segment l2)))
     (vec-mul (start-segment l1) (end-segment l2))
     (vec-mul (end-segment l1) (start-segment l2))))
;; This is like a kind of vector munipulation. Inner munipulation is about
;; vectors start with (0,0).

;; abstraction barriers level of plane.
;; Of course, there may be other procedure that takes different arguments
;; to construct a rectangle.
(define (make-rectangle p1 p2 diagonal-p1)
  (if (= 0 (vector-mul (make-segment p1 p2) (make-segment diagonal-p1 p2)))
      "not rectangle"
      (if (< (length-of-segment (make-segment p2 p1))
             (length-of-segment (make-segment p2 diagonal-p1)))
          (cons (make-segment p2 diagonal-p1) (make-segment p2 p1))
          (cons (make-segment p2 p1) (make-segment p2 diagonal-p1)))))
(define (length r) (car r))
(define (width r) (cdr r))

(define (perimeter-of-rectangle p)
  (* 2 (+ (length-of-segment (length p))
          (length-of-segment (width p)))))

(define (area-of-rectangle p)
  (* (length-of-segment (length p))
     (length-of-segment (width p))))
