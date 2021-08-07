#lang racket

(define (element-of-set? x st)
  (cond ((null? st) #f)
        ((> (car st) x) #f)
        ((= (car st) x) #t)
        (else (element-of-set? x (cdr st)))))

(define (adjoin-set x st)
  (define (iter left right)
    (if (or (null? right) (> (car right) x))
        (append left (cons x right))
        (iter (append left (list (car right))) (cdr right))))
  
  (if (element-of-set? x st)
      st
      (iter null st)))

(define (interestion-set set1 set2)
  (if (or (null? set1) (null? set2))
      null
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2) (cons x1 (interestion-set (cdr set1)
                                                   (cdr set2))))
              ((< x1 x2) (interestion-set (cdr set1)
                                          set2))
              (else (interestion-set set1
                                     (cdr set2)))))))

#|
compare first element of s1 and s2
if (car s1) < (car s2) then:
    if (element-of-set? (car s1) (cdr s1)) then (union (cdr s1) s2)
    else (cons (car s1) (union (cdr s1) s2)
|#

(define (union-set set1 set2)
  ;; (< (car s1) (car s2))
  ;; only s2 can be null
  (define (f s1 s2)
    (if (element-of-set? (car s1) (cdr s1))
        (union-set (cdr s1) s2)
        (cons (car s1) (union-set (cdr s1) s2))))

  (cond ((and (null? set1) (null? set2)) null)
        ((null? set1) (f set2 set1))
        ((null? set2) (f set1 set2))
        ((= (car set1) (car set2)) (union-set set1 (cdr set2)))
        ((< (car set1) (car set2)) (f set1 set2))
        (else (f set2 set1))))

(define s1 (list 1 2 3 4 5))
(define s2 (list 3 4 5 6 7))

(interestion-set s1 s2)
(union-set s1 s2)

(adjoin-set 3 s1)
(adjoin-set 7 s1)
