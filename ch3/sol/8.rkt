#lang racket

(define (ander cur)
  (lambda (x)
    (begin (set! cur (and cur (= x 1)))
           (if cur 1 0))))

(define (left-right)
  (define f (ander #t))
  (define x1 (f 0))
  (define x2 (f 1))
  (+ x1 x2))

(define (right-left)
  (define f (ander #t))
  (define x1 (f 1))
  (define x2 (f 0))
  (+ x1 x2))

(left-right) ;; 0
(right-left) ;; 1
