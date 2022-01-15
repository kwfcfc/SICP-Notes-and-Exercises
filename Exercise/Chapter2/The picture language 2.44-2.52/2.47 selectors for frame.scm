(define (make-frame-list origin edge1 edge2)
  (list origin edge1 edge2))

;; selectors
(define origin-frame-list car)
(define edge1-frame-list cadr)
(define edge2-frame-list caddr)

(define (make-frame-cons origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

;; selectors
(define origin-frame-cons car)
(define edge1-frame-cons cadr)
(define edge2-frame-cons cddr)

;; we decide to use list to represent the frame
(define origin-frame origin-frame-list)
(define edge1-frame edge1-frame-list)
(define edge2-frame edge2-frame-list)
