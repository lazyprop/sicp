(define (inc x) (+ x 1))
(define (identity x) x)

(define (acc-recur combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (acc-recur combiner null-value term (next a) next b))))

(define (acc-iter combiner null-value term a next b)
  (define (iter count cur)
    (if (> count b)
        cur
        (iter (next count) (combiner cur (term count)))))
  (iter a null-value))

(acc-recur + 0 identity 1 inc 10)
(acc-iter + 0 identity 1 inc 10)
