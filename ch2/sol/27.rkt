#lang racket

(define (reverse items)
  (if (null? (cdr items))
      items
      (append (reverse (cdr items)) (list (car items)))))

(define (deep-reverse items)
  (cond ((null? items) items)
        ((not (pair? items)) items)
        (else (append (deep-reverse (cdr items)) (list (deep-reverse (car items)))))))

(define x (list (list 1 2) (list 3 4)))

x
(reverse x)
(deep-reverse x)
(deep-reverse (list (list 1 2) (list 3 4) (list 5 6 (list 7 8))))
