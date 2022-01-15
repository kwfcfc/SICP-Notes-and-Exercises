(load "./header.scm")
;; Louis Reasoner has interchanged the order of the nested mappingsin the
;; flatmap, writing it as
(flatmap
 (lambda (new-row)
   (map (lambda (rest-of-queens)
          (adjoin-position new-row k rest-of-queens))
        (queen-cols (- k 1))))
 (enumerate-interval 1 board-size))
;;assuming that the program in Exercise 2.42(./2.42 queens.scm)
;;solves the puzzle in time T .
(enumerate-interval 1 board-size)
;; will produce a much larger list than (queen-cols k), because it doesn't filter
;; those lists that is already not valid. If 2.42 is T, this 2.43 will
;; be (square T), as (enumerate 1 board-size) in each row will produce
;; (square board-size) results, The whole time will be (square T) because
;; the procedure will do an extra (square T) filter.
;; When n is given 8, if 2.42 returns T, 2.43 will return about 500 times of
;; T.(Need some more detailed proof in Math and Algorithm Analysis.
;; The 2.42 is O(N^4) complexity, while 2.43 is O(N^N) complexity.
;; see https://wernerdegroot.wordpress.com/2015/08/01/sicp-exercise-2-43/
