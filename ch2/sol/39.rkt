#lang racket

(require "helpers.rkt")

(define (fold-left op initial sequence)
  (define (iter result seq)
    (if (null? seq)
        result
        (iter (op result (car seq))
              (cdr seq))))
  (iter initial sequence))

(define fold-right accumulate)

(define (reverse sequence)
  (fold-right
   (lambda (x y)
     (append y (list x)))
   null
   sequence))

(reverse (list 1 2 3))


(define (reverse-right sequence)
  (fold-left
   (lambda (x y)
     (append (list y) x))
   null
   sequence))

(reverse-right (list 1 2 3))
