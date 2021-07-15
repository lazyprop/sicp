#lang racket

(define (prime? n)
  (define (iter i)
    (cond ((> i (/ n 2)) #t)
          ((= 0 (remainder n i)) #f)
          (else (iter (+ i 1)))))
  (iter 2))
(provide prime?)

(define (enumerate-interval a b)
  (if (> a b)
      null
      (cons a
            (enumerate-interval (+ 1 a) b))))
(provide enumerate-interval)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(provide accumulate)

(define (accumulate-n op initial seqs)
  (if (null? (car seqs))
      null
      (cons (accumulate op initial (map car seqs))
            (accumulate-n op initial (map cdr seqs)))))
(provide accumulate-n)

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))
(provide flatmap)
