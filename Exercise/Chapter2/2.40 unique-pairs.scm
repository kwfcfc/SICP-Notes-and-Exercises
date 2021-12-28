(load "./headers.scm")
;; here we load the accumulate procedure

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (prime-sum-pairs n)
  (map (lambda (x)
         (list (car x)
               (cadr x)
               (+ (car x) (cadr x))))
       (filter prime-sum? (unique-pairs n))))
       

(define (prime? x)
  (define (test n)
    (cond ((> (* n n) x) true)
          ((= (remainder x n) 0) false)
          (else (test (+ 1 n)))))
  (test 2))

(define (prime-sum? x)
  (prime? (+ (car x) (cadr x))))
