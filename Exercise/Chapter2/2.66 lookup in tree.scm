;; *Exercise 2.66:* Implement the `lookup' procedure for the case
;; where the set of records is structured as a binary tree, ordered
;; by the numerical values of the keys.


(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) false)
        ((equal? given-key (key (car set-of-records)))
         (car set-of-records))
        (else (lookup given-key (cdr set-of-records)))))

;; we define a tree-of-records has the structure of tree, with every is a list
;; of cons of key and record's information.
(define (key-tree tree-of-records)
  (car (entry tree-of-records)))

(define (record-tree tree-of-records)
  (cdr (entry tree-of-records)))

(define (lookup-tree given-key tree-of-records)
  (cond ((null? tree-of-records) false)
        ((equal? given-key (key-tree tree-of-records))
         (record-tree tree-of-records))
        (else (or (lookup-tree given-key (left-branch tree-of-records))
                  (lookup-tree given-key (right-branch tree-of-records))))))
