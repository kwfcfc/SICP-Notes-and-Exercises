;; For this representation, verify that (car (cons x y)) yields x for
;; any objects x and y.
;; What is the corresponding definition of cdr?

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

;; test using substitution model
(car (cons 7 6))
(car (lambda (m) (m 7 6)))
((lambda (m) (m 7 6)) (lambda (p q) p))
((lambda (p q) p) 7 6)

;; Here is the answer.
(define (cdr z)
  (z (lambda (p q) q)))

;; This one is more abstract than the I write in the note, since
;; I only change the message of predicate.
;; However, I think it is just sticking around the form of parentheses.
;; Just by simply blurring the distinguishment of operator and operand.
;; It uses the most common pattern of pair.
