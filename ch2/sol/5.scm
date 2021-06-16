(define (cons a b) (* (expt 2 a) (expt 3 b)))

(define (count-fact x b n)
  (if (> (remainder x b) 0) n (count-fact (/ x b) b (+ n 1))))

(define (car p) (count-fact p 2 0))
(define (cdr p) (count-fact p 3 0))

(define p (cons 4 7))
(display (car p))
(newline)
(display (cdr p))
(newline)
