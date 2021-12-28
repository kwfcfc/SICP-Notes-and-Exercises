;; define a constant
(define nil '())
;;The procedures listed here are some common procedures
;;first provided in the book SICP, and were frequently called
;;by exercises

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ 1 low) high))))
                   
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
