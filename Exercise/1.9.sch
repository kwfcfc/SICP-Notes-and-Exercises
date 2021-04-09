;;(define (+ a b)
;;  (if (= a 0)
;;     b
;;      (inc (+ (dec a) b))))

;;(define (+ a b)
;;  (if (= a 0)
;;      b
;;      (+ (dec a) (inc b))))

(+ 4 5)

;; The first process would illustrate the process as following:

(inc (+ 3 5))
(inc (inc (+ 2 5)))
(inc (inc (inc (+ 1 5))))
(inc (inc (inc (inc (+ 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9

;; As the (inc a) operations is deferred each time, it is clearly that
;; it is a recursive process.

