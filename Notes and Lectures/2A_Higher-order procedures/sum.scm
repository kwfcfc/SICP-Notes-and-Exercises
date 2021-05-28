(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) b))))
;; The following two procedures is shared a common pattern.

(define (<name> a b)
  (if (> a b)
      0
      (+ (<term> a)
         (<name> (<next> a) b))))

(define (sum-int a b)
  (define (inc n)
    (+ 1 n))
  (define (itself a) a)
  (sum itself a inc b))

(define (sum-sq a b)
  (define (inc n)
    (+ 1 n))
  (define (square a)
    (* a a))
  (sum square a inc b))

;; These two procedures are both from the first (sum) procedure.
;; The next is pi-sum
(define (pi-sum a b)
  (sum (λ(i) (/ 1 (* i (+ i 2))))
       a
       (λ(i) (+ i 4))
       b))
;; Here we use λ notation to insert a procedure without the (define) procedure to name it.
          
;; Now we are going to have something more interesting.

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (sum f (+ a (/ dx 2.0)) add-dx b))
;; Here we use 2.0 instead of 2 because we want numerical result rahter than rational numbers.
  
    
