(define (split put smaller-stack)
  ;; smaller-stack deals with two smaller split's behaviour
  ;; put deals with the bigger image and the smaller one
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split direction) painter (- n 1))))
          (put painter (smaller-stack smaller smaller))))))

(define right-split (split beside below))
(define up-split (split below beside))
