;; EXERCISE 2.6
(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(add-1 zero)
(add-1 (λ(f) (λ(x) x)))
(λ(f) (λ(x) (f (((λ(a) (λ(b) b)) f) x))))
(λ(f) (λ(x) (f x)))

(define one (lambda (f) (lambda (x) (f x))))
(add-1 one)
(λ(f) (λ(x) (f (((λ(a) (λ(b) (a b))) f) x))))
(λ(f) (λ(x) (f ((λ(b) (f b)) x))))
(λ(f) (λ(x) (f (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))
;; look carefully at add-1 particularly in ((n f) x), get to understand
;; that here it is trying to "unwrapping" the λ-calculus procedure.
(add-1 (add-1 n))
(add-1 (λ(a) (λ(b) (a ((n a) b)))))
(λ(f) (λ(x) (f (((λ(a) (λ(b) (a ((n a) b)))) f) x))))
(λ(f) (λ(x) (f ((λ(b) (f ((n f) b))) x))))
(λ(f) (λ(x) (f (f ((n f) x)))))
(define (add-2 n)
  (lambda (f) (lambda (x) ((two f) ((n f) x)))))
;; two here will first receive an argument f, then x, I call it a process
;; of wrapping. And we can make easy analogy that for arbitrary m, it needs
;; the same form as add-2, cause the number here are define by a procedure
;; that calls another procedure inside.
(define (add a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))
