#lang racket
(require sicp-pict)

(define wave einstein)

(define (split h1 h2)
  (define (recur painter n)
    (if (= n 0)
        painter
        (let ((smaller (recur painter (- n 1))))
          (h1 painter
              (h2 smaller smaller)))))
  recur)

(define right-split (split beside below))
(define up-split (split below beside))

(paint (right-split wave 5))
(paint (up-split wave 5))
