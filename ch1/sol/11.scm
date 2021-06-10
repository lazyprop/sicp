(define (f-recur n)
  (if (< n 3)
      n
      (+ (f-recur (- n 1))
         (* 2 (f-recur (- n 2)))
         (* 3 (f-recur (- n 3))))))


(define (f-iter n)
  (define (iter i a b c)
    (if (= i n)
        (sum a b c)
        (iter (+ i 1) (sum a b c) a b)))

  (define (sum a b c)
    (+ a
       (* 2 b)
       (* 3 c)))

  (if (< n 3)
      n
      (iter 3 2 1 0)))

(= (f-recur 10) (f-iter 10))
(= (f-recur 15) (f-iter 15))
