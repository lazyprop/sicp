#lang racket

(define (make-accumulator sum)
  (define (dispatch x)
    (begin (set! sum (+ sum x))
           sum))
  dispatch)

(define A (make-accumulator 5))

(A 10) ;; 15
(A 10) ;; 25
