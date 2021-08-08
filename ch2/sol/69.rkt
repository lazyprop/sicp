#lang racket

(require "../huffman.rkt")

(define (successive-merge nodes)
  (cond ((null? nodes) null)
        ((null? (cdr nodes)) (car nodes))
        (else (successive-merge (adjoin-set
                                 (make-tree (car nodes)
                                            (cadr nodes))
                                 (cddr nodes))))))

(define (generate-huffman-tree pairs)
  (successive-merge
   (make-leaf-set pairs)))

(define sample-pairs (list '(A 4)
                           '(B 2)
                           '(C 1)
                           '(D 1)))

(define sample-message 
  '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(define newtree (generate-huffman-tree sample-pairs))

(decode sample-message newtree)
