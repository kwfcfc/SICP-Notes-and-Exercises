(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;; a. write selector to return left-branch and right branch, length and
;; structure

(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (cadr mobile))

(define (length branch) (car branch))
(define (structure branch) (cadr branch))

;; b. Now define the total-weight procedure
(define (total-weight mobile)
  (define (branch-weight branch)
    (cond ((list? (structure branch))
           (total-weight (structure branch)))
          (else (structure branch))))
  (if (pair? mobile)
      (+ (branch-weight (left-branch mobile))
         (branch-weight (right-branch mobile)))
      mobile))

;; c. balanced? procedure
(define (balanced? mobile)
  (define (balance-equation left right)
    (= (* (length left) (branch-weight left))
       (* (length right) (branch-weight right))))
  (let ((l (left-branch mobile))
        (r (right-branch mobile)))
    (cond ((and (not (pair? (structure l)))
                (not (pair? (structure r))))
           (balance-equation l r))
          ((and (pair? (structure l))
                (not (pair? (structure r))))
           (and (balance-equation l r)
                (balanced? (structure l))))
          ((and (not (pair? (structure l)))
                (pair? (structure r)))
           (and (balance-equation l r)
                (balanced? (structure r))))
          ((and (pair? (structure l))
                (pair? (structure r)))
           (and (balance-equation l r)
                (balanced? (structure l))
                (balanced? (structure r)))))))

;; This one is too dull to list out all of the conditions by testing the positive results.
;; The upper one have too much repition. Here is a better solution.
(define (balanced? mobile)
  (define (balance-equation left right)
    (= (* (length left) (branch-weight left))
       (* (length right) (branch-weight right))))
  (let ((l (left-branch mobile)) (r (right-branch mobile)))
    (cond ((and (pair? (structure l)) (balanced? (structure l))) #f)
          ((and (pair? (structure r)) (balanced? (structure r))) #f)
          (else (balance-equation l r)))))

;; d. change the representation of mobiles
(define (make-mobile left right) (cons left right))
(define (make-branch length structure)
  (cons length structure))

;; my changes, rewrite the selectors, especially right-branch and structure
(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (cdr mobile))

(define (length branch) (car branch))
(define (structure branch) (cdr branch))
