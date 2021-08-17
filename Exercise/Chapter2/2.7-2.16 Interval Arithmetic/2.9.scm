;; Show that the width of the sum (or difference) of two intervals is a function
;; only of the widths of the intervals being added (or subtracted).
;; Give examples to show that this is not true for multiplication or division.

(define (make-interval a b) (cons a b))
(define (lower-bound z) (car z))
(define (upper-bound z) (cdr z))

(define (width x)
  (/ (- (upper-bound x) (lower-bound x)) 2))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

;; the width of result of adding two intervals is a function only of width of
;; intervals. It's kind of linear combination of two widths of the intervals.
;; However, the multiplication will deal with the value itself rather than the
;; range, so the width will not be a function only of widths.
