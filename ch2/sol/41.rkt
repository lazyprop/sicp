#lang racket

(require "../../helpers.rkt")

(define (triplet-sum trip)
  (+ (car trip)
     (cadr trip)
     (caddr trip)))

(define (unique-triplets n)
  (flatmap (lambda (i)
             (flatmap (lambda (j)
                        (map (lambda (k)
                               (list i j k))
                             (enumerate-interval
                              1
                              (- 1 j))))
                      (enumerate-interval
                       1
                       (- 1 i))))
           (enumerate-interval 1 n)))

(unique-triplets 10)
