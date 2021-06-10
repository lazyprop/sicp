(define (double x) (+ x x))
(define (half x) (/ x 2))
(define (even? x) (= (remainder x 2) 0))

(define (* a b)
  (define (iter x y)
    (cond ((= y 1) x)
          ((even? y) (* (+ x a) (- y 1)))))
          (else (* (double a) (half y)))
  (iter a b))

(* 4 3)

(* 3 4)
