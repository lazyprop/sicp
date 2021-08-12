#lang racket

;; toy bank account simulation to demonstrate local mutable state

(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance
                     (- balance amount))
               balance)
        "Insufficient Funds"))
  (define (deposit amount)
    (set! balance (+ amount balance)))
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown Request: make-account"
                       m))))
  dispatch)

(define acc1 (make-account 100)) ;; returns the dispatch procedure

((acc1 'withdraw) 10) ;; 90
((acc1 'withdraw) 20) ;; 70
((acc1 'withdraw) 80) ;; "Insufficient Funds"
((acc1 'deposit) 45)
((acc1 'withdraw) 5) ;; 110

(define acc2 (make-account 200)) ;; separate account object
((acc2 'withdraw) 30) ;; 170
