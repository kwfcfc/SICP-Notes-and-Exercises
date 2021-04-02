(define good-enough (lambda (guess)
                    (< (abs (- (square guess) x)) 0.1)))
;; A btter alternative for good-enuf? is substitute the 0.1 with
;; several percentage of guess
;; 用guess的若干分之一代替原来的0.1
(define better-enough (lambda (guess)
                        (< (abs (- (square guess) x))
                           (* guess 0.01))))

;; Another choice is to insert another varible "oldguess"
;; 另外一个处理办法是引入一个新的变量"oldguess", 计算"oldguess"和
;; "guess"之差与"guess"的比

;; 这个问题事实上反映了算法的理想性与机器算力的现实限制的差距。
;; 不过处理浮点数也一直是难缠的问题，此处暂不详细考虑。
  
