#lang racket

(require "../huffman.rkt")

(define sample-tree
  (make-tree 
   (make-leaf 'A 4)
   (make-tree
    (make-leaf 'B 2)
    (make-tree 
     (make-leaf 'D 1)
     (make-leaf 'C 1)))))

(define sample-message 
  '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(decode sample-message sample-tree)
