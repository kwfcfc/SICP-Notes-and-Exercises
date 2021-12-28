(load "./headers.scm")
(define (queens board-size)
  (define (queen-cols k)  
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k
                                    rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

;; the representation of a board is a list with
;; k elements that records the position of each queen.
(define empty-board nil)
(define (adjoin-position new-row k rest-of-queens)
  ;; the board is a list, and this procedure will
  ;; add new-row at kth place
  ;; '(<col 1> <col 2> <col 3> <col 4>)
  (if (= k 1)
      (list new-row)
      (accumulate cons (list new-row) rest-of-queens)))

(define (col k positions)
  ;; find the kth queen in kth column
  (if (= k 1)
      (car positions)
      (col (- k 1) (cdr positions))))
       
(define (safe? k positions)
  (define (col-k x) (col x positions))
  (= 0
     (accumulate +
                 0
                 (map (lambda (i)
                        (if (or (= (col-k i) (col-k k))
                                (= (col-k i) (+ (col-k k) (- k i)))
                                (= (col-k i) (+ (col-k k) (- i k))))
                         1
                         0))
                      (enumerate-interval 1 (- k 1))))))
