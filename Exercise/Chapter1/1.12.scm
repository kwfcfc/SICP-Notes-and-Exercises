(define (pascal-triangle row col)
  (cond ((or (= 1 col) (= row col)) 1)
        ((> col row) 0)
        (else (+ (pascal-triangle (- row 1) (- col 1))
                 (pascal-triangle (- row 1) col)))))

(pascal-triangle 5 4)
                          
