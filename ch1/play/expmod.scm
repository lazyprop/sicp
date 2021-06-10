(define (expmod a n m)
  (cond ((= n 0) 1)
        ((even? n)
         (remainder (square (expmod a (/ n 2) m)) m))
        (else
          (remainder (* a (expmod a (- n 1) m)) m))))

(expmod 2 312 27)
