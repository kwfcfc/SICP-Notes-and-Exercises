(load "./headers.scm")

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (unique-lists x k)
    ;; A intuitive approach is to cons element to a pair (j k)
    ;; At first I was trying to construct a tuple by (list i j k)
    ;; However, it does not work when it comes to (list i nil nil)
    (cond ((= k 1) (enumerate-interval 1 x))
          ((= k 2) (unique-pairs x))
          (else (flatmap (lambda (i)
                           (map (lambda (j) (cons j i))
                                (enumerate-interval
                                 (+ 1 (car i)) x)))
                         (unique-lists x (- k 1))))))
  ;; The idea is simple, flatmap will receive a list of
  ;; k-1 tuple that is sorted from large to small, therefore
  ;; it will cons the kth element that is larger than the
  ;; first of (car list) with rest of the list

(define (find-triples-of-sum n s)
  (define (sum-of-s? x)
    (= (+ (car x)
          (cadr x)
          (car (cddr x)))
       s))
  (filter sum-of-s? (unique-lists n 3)))

