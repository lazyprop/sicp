#lang racket

(define (element-of-set? x st)
  (cond ((null? st) #f)
        ((= (car st) x) #t)
        (else (element-of-set? x (cdr st)))))
