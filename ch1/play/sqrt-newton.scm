(define (sqrt x)
 (define (average x y)
   (/ (+ x y) 2))
 
 (define (improve guess x)
   (average guess (/ x guess)))
 
 (define (good-enough? guess x)
   (< (abs (- (square guess) x)) 0.001))
 
 (define (sqrt-iter guess x)
   (if (good-enough? guess x)
       guess
       (sqrt-iter (improve guess x) x)))

 (sqrt-iter 1.0 x))

(display (sqrt 100))
(newline)
