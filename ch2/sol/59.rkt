#lang racket

(define (element-of-set? x st)
  (cond ((null? st) #f)
        ((= (car st) x) #t)
        (else (element-of-set? x (cdr st)))))

(define (adjoin-set x st)
  (if (element-of-set? x st)
      st
      (cons x st)))

(define (interestion-set set1 set2)
  (cond ((or (null? set1) (null? set2)) null)
        ((element-of-set? (car set1) set2) (cons (car set1)
                                                 (interestion-set (cdr set1)
                                                                  set2)))
        (else (interestion-set (cdr set1)
                               set2))))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((element-of-set? (car set1) set2) (union-set (cdr set1)
                                                      set2))
        (else (cons (car set1) (union-set (cdr set1)
                                          set2)))))


(define s1 (list 1 2 3 4 5))
(define s2 (list 3 4 5 6 7))

(adjoin-set 3 s1)
(adjoin-set 7 s1)
(interestion-set s1 s2)
(union-set s1 s2)
