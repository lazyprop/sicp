#lang racket

(define (square x) (* x x))


(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items null))

(square-list (list 1 2 3 4 5))

;; this does not work because it conses the square of first element
;; of things to the answer
;; in second iteration, answer would be (cons (square 2) (1))
;; so the result is in reverse order

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square 
                     (car things))))))
  (iter items nil))

(square-list (list 1 2 3 4 5))

;; this version does not work because the (cdr things) returns a list
;; so the results would be (list (list (list ...)))
