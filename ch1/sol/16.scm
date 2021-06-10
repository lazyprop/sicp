(define (fast-exp x n)
  (define (iter i a)
    (cond ((= i n) a)
          ((even? (floor (/ n i))) (iter (* i 2) (square a)))
          (else (iter (+ i 1) (* a x)))))

  (iter 1 x))

(define (even? x)
  (= (remainder x 2) 0))
