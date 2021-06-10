(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; normal order (fully expand then reduce)
(gcd 206 40)
(if (= 40 0) ...)
(if #f ...)
(gcd 40 (remainder 206 40))
(if (= (remainder 206 40) 0) ...)
(if (= 6 0) ...)
(if #f ...)
(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
(if (= (remainder 40 (remainder 206 40)) 0) ...)
(if (= (remainder 40 6) 0) ...)
(if (= 4 0) ...)
(if #f ...)
(gcd (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40) (remainder (40 (remainder (206 40))))))
...


; applicative order (evaluate args then apply)
