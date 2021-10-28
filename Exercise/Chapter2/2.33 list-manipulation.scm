;; Fill in the missing expression
(define (map p sequence)
  (accumulate (lambda (x y) <??>) nil sequence))
(define (append seq1 seq2)
  (accumulate cons <??> <??>))
(define (length sequence)
  (accumulate <??> 0 sequence))

;; Here are the answers
(define (map-acc p sequence)
  (accumulate (lambda (x y)
                (cons (p x)
                      y))
              nil sequence))

(define (append-acc seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length-acc sequence)
  (accumulate (lambda (x y)
                (+ 1 y))
              0 sequence))

;; The (length sequence) prodecure uses a technique that takes in a argument
;; without using it and give output.
