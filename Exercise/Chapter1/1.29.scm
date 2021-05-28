;; Use Simpson's rule to rewrite the integral function
(define (sum term a next b)
  (if (or (> a b) (= a b));; Here need to revise into >=
      0
      (+ (term a)
         (sum term (next a) next b))))

;; The previous method to do integral.
(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* dx (sum f (+ a (/ dx 2.0)) add-dx b)))
;; The formal answer
(define (Simpson-integral f a b n)
  (define h (/ (- b a) n))
  (define (next a) (+ a h h))
  (define (sum-term a)
    (* (/ h 3.0) (+ (f a)
                  (* 4 (f (+ a h)))
                  (f (next a)))))
  (sum sum-term a next b))

;; Here is a recursive Simpson Rule's Integral.
(define (Simpson-intgr-one f a b)
  (if (> a b)
      0
      (* (/ (- a b) 6.0)
         (+ (f a) (* 4 (f (/ (+ a b) 2.0))) (f b)))))

;; Test cube and test range
(define (cube a)
  (* a a a))
(integral cube 0 1 0.01)
(Simpson-integral cube 0 1 100)

(integral cube 0 1 0.001)
(Simpson-integral cube 0 1 1000)

;;Here is the output, notice that the latter procedure has much more accuracy.
;;Value: .24998750000000042
;;Value: .25

;;Value: .249999875000001
;;Value: .25000000000000006
