;; rewrite the sum and product in order to allow arbitrary numbers
;; of terms.
(load "../headers.scm")
(define (variable? x) (symbol? x))
(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (sum? x)
   (and (pair? x) (eq? (car x) '+)))
(define (product? x)
  (and (pair? x) (eq? (car x) '*)))
(define (multiplier p) (cadr p))
(define (multiplicand p) (caddr p))

;; actually make-sum-n take arbitrary numbers means
;; it does not need to take at least two arguments
(define (make-sum . lst) (make-sum-n lst))
(define (make-sum-n lst)
  (define (numer-sum add-list)
    (define (iter result rest)
      (cond ((null? rest) result)
            ((number? (car rest))
             (iter (+ result (car rest)) (cdr rest)))
            (else (iter result (cdr rest)))))
    (iter 0 add-list))
  (cond ((null? lst) 0)
        ((not (pair? lst)) lst)
          (else (let ((constant (numer-sum lst))
                       ;;(accumulate + 0 (filter number? added))
                      (exp1 (cons '+ (filter (lambda (x) (not (number? x)))
                                             lst))))
                  (if (=number? constant 0)
                      exp1
                      (append exp1 (list constant)))))))
  
(define addend cadr)
(define (augend s)
  (make-sum-n (cddr s)))

         
(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))

;; test
(define test (make-sum 'a 1 2 '(+ 1 3 (+ 2 x a)) 'x '(* 7 y)))

;;
;; (expand '(+ a 1 2 (+ 1 3 (+ 2 x a)) x (* 7 y)))
