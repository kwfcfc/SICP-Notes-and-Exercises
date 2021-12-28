;; Fill in the missing expressions in the following definition of accumulate-n
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;;(define (accumulate-n op init seqs)
;;  (if (null? (car seqs))
;;      nil
;;      (cons (accumulate op init <??>)
;;            (accumulate-n op init <??>))))

(define nil ())
;; Here are the answers
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))
