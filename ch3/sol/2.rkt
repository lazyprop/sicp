#lang racket

(define (make-monitored f)
  (define count 0)
  (define (dispatch m)
    (cond ((eq? m 'how-many-calls?) count)
          ((number? m) (begin (set! count (add1 count))
                              (f m)))
          (else (error "Unknown Message: make-monitored"
                       m))))
  dispatch)

(define s (make-monitored sqrt))

(s 100) ;; 10
(s 'how-many-calls?) ;; 1

