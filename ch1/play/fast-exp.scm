(define (fast-exp a n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-exp a (/ n 2))))
        (else (* a (fast-exp a (- n 1))))))

(define (even? n) (= 0 (remainder n 2)))

(display (fast-exp 2 100))
(newline)
