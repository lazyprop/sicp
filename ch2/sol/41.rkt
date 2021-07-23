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
                             (enumerate-interval 1 (sub1 j))))
                      (enumerate-interval 1 (sub1 i))))
           (enumerate-interval 1 n)))


(define (all-triplet-sum-to-s s n)
  (filter (lambda (trip)
            (= (triplet-sum trip)
               s))
          (unique-triplets n)))

(all-triplet-sum-to-s 15 10)
