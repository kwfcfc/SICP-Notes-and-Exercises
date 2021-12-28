(load "./headers.scm")
(define (queens board-size)
  (define (queen-cols k)  
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

;; the representation of a board is a list with
;; k elements that records the position of each queen.
(define empty-board nil)
(define (adjoin-position new-row rest-of-queens)
  ;; the board is a list, and this procedure will
  ;; add new-row at kth place
  ;; This is changed into '(<col 4> <col 3> <col 2> <col 1>) now
  ;; and here it is not necessary to pass the k to procedure itself
  ;; unless the boundary condition.
  (if (null? rest-of-queens)
      (list new-row)
      (cons new-row rest-of-queens)))

(define (col k positions)
  ;; find the kth queen in kth column
  (if (= k 1)
      (car positions)
      (col (- k 1) (cdr positions))))
       
(define (safe? positions)
  (define (iter-check cnt board k)
    (cond ((null? board) #t)
          ((or (= k (car board))
               (= (+ k cnt)
                  (car board))
               (= (- k cnt)
                  (car board)))
           #f)
          (else (iter-check (+ cnt 1) (cdr board) k))))
  ;; according to the new representation of the board, now we only need
  ;; one argument to check the board, that is to check the (car positions)
  ;; and the rest of the positions.
  (iter-check 1 (cdr positions) (car positions)))

(define (ordered-queens n)
  (define (reverse l)
    (define (iter items result)
      (if (null? items)
          result
          (iter (cdr items)
                (cons (car items) result))))
    (iter l ()))
  (map (lambda (x) (reverse x)) (queens n)))
;; In my computer, the procedure will reach the maximum of recursion depth when
;; the input is 12. And it is faster than the last version, which may even have no response at input of 11
