(define  (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;; Each time recursion is operated, a new line of
;; expression is needed. A recursive procedure
;; (here the specific recursion is tail recursion)
;; would recall a new expression. Since here it is
;; only a tail recursion. The previous procedure will
;; not need to be run anymore.

(gcd 206 40)
;; Here is the normal-order-evaluation.
(if (= 40 0)
    206
    (gcd 40 (remainder 206 40)))

;; remainder: 1, watch how to deal the (gcd <?> <?>) in the normal-order evaluation.
(gcd 40 (remainder 206 40))
(if (= (remainder 206 40) 0)
    40
    (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))

(if (= 6 0)
    40
    (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))

;; remainder: 1, watch how to deal the (gcd <?> <?>) in the normal-order evaluation.
(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
(if (= (remainder 40 (remainder 206 40)) 0)
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
         (remainder (remainder 206 40)
                    (remainder 40 (remainder 206 40))
                    )))

(if (= 4 0)
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
         (remainder (remainder 206 40)
                    (remainder 40 (remainder 206 40))
                    )))
;; remainder: 2
     
(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))

;; notice the first line of the procedure
;; (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
;; (if (= (remainder (remainder 206 40) (remainder 40 6)) 0)
;; (if (= (remainder (remainder 206 40) 4) 0)
;; (if (= (remainder 6 4) 0)
;; (if (= 2 0)
(if (= 2 0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
;; remainder: 4

(if (= (remainder (remainder 40 (remainder 206 40))
                  (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
       0)
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
         (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
                    (remainder (remainder 40 (remainder 206 40))
                               (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))

;; Watch the first two lines
;; (if (= (remainder (remainder 40 (remainder 206 40))
;;                   (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;; (if (= (remainder (remainder 40 6)
;;                   (remainder 6 (remainder 40 6))) reduce the (remainder 206 40), 3 of them.
;; (if (= (remainder 4 (remainder 6 4)) reduce the (remainder 40 6), 2 of them.
;; (if (= (remainder 4 2), 1 of (remainder 6 4)
;; (if (= 0, 1 of (remainder 4 2), 1 of (remainder 4 2)
;; remainder called in total: 7

;; now the predicate is true:
(if (= 0 0)
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
         (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
                    (remainder (remainder 40 (remainder 206 40))
                               (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))

(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
(remainder (remainder 206 40) (remainder 40 6))
(remainder (remainder 206 40) 4)
(remainder 6 4)
2           
;; and it is obvious there is 4 calls of procedure (remainder)

;; There are in total 18 times call of procedure (remainder).

;; The applicative-order evaluation
(gcd 206 40)
(if (= 40 0)
    206
    (gcd 40 (remainder 206 40)))

(gcd 40 (remainder 206 40))
(gcd 40 6)
;; 1 call of (remainder <?> <?>)
(gcd 40 6)
(if (= 6 0)
    40
    (gcd 6 (remainder 40 6)))

(gcd 6 (remainder 40 6))
(gcd 6 4)
;; 1 call.
(gcd 6 4)
(if (= 4 0)
    6
    (gcd 4 (remainder 6 4)))

(gcd 4 (remainder 6 4))
(gcd 4 2)
;; 1 call
(if (= 2 0)
    4
    (gcd 2 (remainder 4 2)))

(gcd 2 (remainder 4 2))
(gcd 2 0)
;; 1 call.
(gcd 2 0)
(if (= 0 0)
    2
    (gcd 0 (remainder 2 0)))

2
;; In total, applicative-order evaluation needs 4 calls of
;; (remainder <?> <?>) procedure.
