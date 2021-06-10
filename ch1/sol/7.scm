(define (sqrt-iter guess x)
  (cond ((not (good-enough? guess x))
         (display guess)
         (newline)
         (sqrt-iter (improve guess x) x))
        (else guess)))

(define (good-enough? guess x)
  (< (/ (abs (- (improve guess x) guess)) guess) 0.000000001))

(define (improve guess x)
  (/ (+ guess (/ x guess)) 2))

(display (sqrt-iter 1.0 1000000000000000000))
(newline)
(newline)
(display (sqrt-iter 1.0 0.00000000000001))
(newline)
