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

(fold-right / 1 (list 1 2 3)) ; 3 / 2 / 1 = 3 / 2
(fold-left  / 1 (list 1 2 3)) ; 1 / 2 / 3 = 1 / 6
(fold-right list null (list 1 2 3)) ; '(1 (2 (3 ()))
(fold-left  list null (list 1 2 3)) ; '(((() 1) 2) 3)

;; fold-right and fold-left are equivlanet when op is commutative

(fold-right + 0 (list 1 2 3))
(fold-left + 0 (list 1 2 3))
