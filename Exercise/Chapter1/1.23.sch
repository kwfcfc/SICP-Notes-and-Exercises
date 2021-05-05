;; This part will define a next procedure instead of simply (+ 1 <?>) to reduce
;; the redundant steps of even numbers.
(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

;; Actually I've done this part in exercise 1.22.sch(The next procedure)
