#lang racket

(require "../derivative.rkt")

(define (deriv expr var)
  (cond ((number? expr) 0)
        ((variable? expr)
         (if (same-variable? expr var) 1 0))
        (else ((get 'deriv (operator expr))
               (operands expr)
               var))))

(define (operator expr) (car expr))
(deifne (operands expr) (cdr expr))
