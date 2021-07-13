#lang racket

(define (map-square-tree tree)
  (map (lambda (subtree)
         (if (pair? subtree)
             (map-square-tree subtree)
             (* subtree subtree)))
       tree))

(map-square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))

(define (square-tree tree)
  (cond ((null? tree) null)
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
