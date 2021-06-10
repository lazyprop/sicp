(define (fib n)
  (define (iter a b i)
    (if (= i n)
        a
        (iter (+ a b) a (+ 1 i))))
  (iter 0 1 0))
