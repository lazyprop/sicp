; (f 1 1) = 4
; (f 2 2) = 43

(define (f x y)
  ((lambda (a b)
    (+ (* x (square a))
       (* y b)
       (* a b)))
   (+ 1 (* x y))
   (- 1 y)))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
 
(define (inc x)
  (+ x 1))

(sum square 1 inc 10)
