;; two primitive procedures
;; below and beside
;; (below a b) put a under b
;; (beside a b) put a at left side of b.
(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))


(up-split wave 3)
