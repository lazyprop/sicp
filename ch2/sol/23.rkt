#lang racket

(define (for-each proc items)
  (if (null? items)
      null
      ((lambda ()
          (proc (car items))
          (for-each proc (cdr items))))))

(for-each displayln (list 1 2 3 4 5))
