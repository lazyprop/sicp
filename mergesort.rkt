#lang racket

(define (take n lst)
  (if (= n 0)
      null
      (cons (car lst) (take (sub1 n) (cdr lst)))))

(define (drop n lst)
  (if (= n 0)
      lst
      (drop (sub1 n) (cdr lst))))

(define (merge l1 l2)
  (cond ((null? l1) l2)
        ((null? l2) l1)
        (else (let ((a (car l1))
                    (b (car l2)))
                (append (if (< a b)
                            (list a b)
                            (list b a))
                        (merge (cdr l1) (cdr l2)))))))

(define (halve n)
  (quotient n 2))

(define (mergesort lst)
  (if (<= (length lst) 1)
      lst
      (let ((n (length lst)))
        (merge (mergesort (take (halve n) lst))
               (mergesort (drop (halve n) lst))))))

;; example
(define lst (list 1 2 3 4 5))

(println (take 3 lst))
(println (drop 3 lst))

(merge (list 1 3 5 7 9)
       (list 2 4 6 8 10))

(mergesort (list 3 1 8 2 7 9))

