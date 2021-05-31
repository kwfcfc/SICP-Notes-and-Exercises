;; Suppose we define the procedure
(define (f g) (g 2))
;; What happens if we (perversely) ask the interpreter to evaluate the
;; combination (f f)? Explain.
(f f)
(f 2)
(2 2)
;; 2 is not appliable. Return error.
