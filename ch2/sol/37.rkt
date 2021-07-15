#lang racket

(require "helpers.rkt")

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (sum seq) (accumulate + 0 seq))

(define (matrix-*-vector m v)
  (map
   (lambda (row)
     (sum (map * row v)))
   m))

(define (transpose mat)
  (accumulate-n cons null mat))

(define (matrix-*-matrix m n)
  (let ((n-cols (transpose n)))
    (map (lambda (m-row)
           (map (lambda (n-col)
                  (dot-product m-row n-col))
                n-cols))
         m)))

(define mat (list (list 1 2 3 4)
                  (list 4 5 6 6)
                  (list 6 7 8 9)))

(define mat2 (list (list 2 3 1)
                  (list 5 9 8)
                  (list 7 3 4)
                  (list 1 2 8)))

(define vect (list 1 2 3 4))

(matrix-*-vector mat vect)
(transpose mat)
(matrix-*-matrix mat mat2)
