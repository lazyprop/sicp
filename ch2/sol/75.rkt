#lang racket

(define (apply-generic op arg) (arg op))

(define (make-from-mag-ang mag ang)
  (define (dispatch op)
    (cond ((eq? op 'real-magnutude) mag)
          ((eq? op 'angle) (ang))))
  dispatch)
