(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(define p (cons 2 3))

(display (car p))
(newline)
(display (cdr p))
(newline)

#|
p is a procedure which takes another procedure and applies it to x and y
car is a procedure which takes another procedure and passes into it a procedure
that takes p and q and returns q
|#

(define proof (= (car p)
                 (car (cons 2 3))
                 (car (lambda (m) (m 2 3)))
                 ((lambda (m) (m 2 3)) (lambda (p q) p))
                 2))

(display proof)
(newline)
