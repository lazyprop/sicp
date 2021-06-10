(define (square x) (* x x))
(define (sum-of-squares x y)
  (+ (square x) (square y)))
(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))

; substitution/applicative order
; 1. evaluate operator to get procedure to be applied
; 2. evaluate operands to get arguments
; 3. substitute arguments in the procedure to be applied

(f 5)
; fetch body of f
(sum-of-squares (+ a 1) (* a 2))
; replace formal parameter a with argument 5
(sum-of-squares (+ 5 1) (* 5 2))
; eval operands and substitute
(sum-of-squares 6 10)
; fetch body of sum-of-squares
(+ (square x) (square y))
; replace formal parameter x with 6 and y with 10
(+ (square 6) (square 10))
; eval operands
; fetch body of square
(+ (* x x) (* y y))
; replace formal parameter x with 6 and y with 10
(+ (* 6 6) (* 10 10))
; eval operands
(+ 36 100)
136

; this is different from normal order where operands are not evaluated
; until they are needed (lazy evaluation)

; normal-order: fully expand then reduce
; applicative-order: evaluate args then apply

; lisp uses applicative order
