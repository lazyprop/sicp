(define (even? n)
  (= (remainder n 2) 0))

(define (fast-exp a n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-exp a (/ n 2))))
        (else (* a (fast-exp a (- n 1))))))
