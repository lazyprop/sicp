(define (cbrt-iter guess x)
  (cond ((not (good-enough? guess x))
         (display guess)
         (newline)
         (cbrt-iter (improve guess x) x))
        (else guess)))

(define (good-enough? guess x)
  (< (/ (abs (- (improve guess x) guess)) guess) 0.000000001))

(define (improve y x)
  (/ (+ (/ x (square y)) (* 2 y)) 3))

(display (cbrt-iter 1.0 27))
(newline)
