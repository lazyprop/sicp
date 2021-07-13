#lang racket

(define (fringe node)
  (cond ((null? node) null)
        ((not (pair? node)) (list node))
        (else (append (fringe (car node)) (fringe (cdr node))))))

(define x (list (list 1 2) (list 3 4)))

(fringe x)
(fringe (list x x))
