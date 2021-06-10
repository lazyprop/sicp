(define (new-if predicate then-clause else-clause)
  (cond ((predicate) (then-clause))
         (else (else-clause))))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (/ (+ guess (/ x guess)) 2))

(define (good-enough? guess x)
  (display guess)
  (newline)
  (< (abs (- (square guess) x)) 0.0001))

(display (sqrt-iter 1.0 100))
(newline)
