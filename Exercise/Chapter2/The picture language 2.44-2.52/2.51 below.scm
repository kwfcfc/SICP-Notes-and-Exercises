(load "./2.50 flip-horiz.scm")
(define (below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5))
        (paint-left (transform-painter painter1
                                       (make-vect 0.0 0.0)
                                       (make-vect 1.0 0.0)
                                       split-point))
        (paint-right (transform-painter painter2
                                        split-point
                                        (make-vect 1.0 0.5)
                                        (make-vect 0.0 1.0))))
    (lambda (frame)
      (paint-left frame)
      (paint-right frame))))

;; here in the (paint-left frame) and (paint-right frame) we find these
;; two procedures were done separately

(define (rotate90 painter)
  (transform-painter painter
                     (make-vect 1.0 0.0)
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 0.0)))

(define (below-by-beside painter1 painter2)
  (rotate270 (beside (rotate90 painter1)
                    (rotate90 painter2))))
