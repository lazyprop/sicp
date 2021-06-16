(define (inc x) (+ x 1))
(define (identity x) x)

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (sum n)
  (accumulate + 0 identity 1 inc n))

(define (product n)
  (accumulate * 1 identity 1 inc n))

(display (sum 10))
(newline)
(display (product 10))
(newline)
