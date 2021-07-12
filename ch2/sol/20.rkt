#lang racket

(define (parity n) (remainder n 2))

(define (same-parity n . args)
  (define (iter l)
    (if (null? l)
        `()
        (append
         (if (= (parity (car l)) (parity n))
             (list (car l))
             null)
         (iter (cdr l)))))
  (cons n (iter args)))

(same-parity 1 2 3 4 5 6 7 8 9)
(same-parity 2 3 4 5 6 7 8 9 10)