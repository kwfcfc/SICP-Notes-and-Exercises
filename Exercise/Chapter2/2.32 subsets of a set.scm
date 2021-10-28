;; Complete the following definition of a procedure that generates the set
;; of subsets of a set and give a clear explanation of why it works:
(define nil ())
(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map
                      ⟨??⟩ rest)))))

<??>
(lambda (subsets-elements)
  (cons (car s) subsets-elements))

;; so the answer would be
(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map
                      (lambda (x) (cons (car s) x))
                      rest)))))

;; The recursion of finding the subsets of a set is, to find those subsets with (car s),
;; and those without (car s), to separate all the subset into having the first element
;; and those having not. Therefore, the result is two parts as lists appended together.
