(load "./2.46 2-d vectors.scm")
(load "./2.47 selectors for frame.scm")
(load "./2.48 segment representation.scm")
(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v)
                           (edge1-frame frame))
               (scale-vect (ycor-vect v)
                           (edge2-frame frame))))))

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame) (start-segment segment))
        ((frame-coord-map frame) (end-segment segment))))
     segment-list)))

;; picture a, outline of frame
(define painter-a
(segments->painter
 (list (make-segment (make-vect 0 0) (make-vect 0 1))
       (make-segment (make-vect 0 1) (make-vect 1 1))
       (make-segment (make-vect 1 1) (make-vect 1 0))
       (make-segment (make-vect 1 0) (make-vect 0 0)))))

;; picture b, an "X" by connecting opposite corners of the frame
(define painter-b
(segments->painter
 (list (make-segment (make-vect 0 0) (make-vect 1 1))
       (make-segment (make-vect 1 0) (make-vect 0 1)))))

;; picture c, the painter draws a diamond shape
(define painter-c
(segments->painter
 (list (make-segment (make-vect 0.5 0) (make-vect 0 0.5))
       (make-segment (make-vect 0 0.5) (make-vect 0.5 1))
       (make-segment (make-vect 0.5 1) (make-vect 1 0.5))
       (make-segment (make-vect 1 0.5) (make-vect 0.5 0)))))

;; picture d,
(define painter-d
  wave)
