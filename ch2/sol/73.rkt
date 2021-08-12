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

;; most of the conditions int he deriv procedure were
;; replaced with a get procedure call to make the impelementation
;; more data directed. (get 'deriv (operator exp) ...) call gets the
;; procedure according to type tags and then it is applied to operands.
