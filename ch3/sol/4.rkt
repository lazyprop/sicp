#lang racket

;; toy bank account simulation to demonstrate local mutable state

(define (make-account balance secret-password)
  (define count 0)

  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance
                     (- balance amount))
               balance)
        "Insufficient Funds"))

  (define (deposit amount)
    (set! balance (+ amount balance)))

  (define (call-the-cops)
    "FBI OPEN UP!")

  (define (raise-error . args)
    (set! count (add1 count))
    (if (= count 7)
        (call-the-cops)
        "Incorrect Password"))

  (define (dispatch pass m)
    (if (eq? pass secret-password)
        (begin (set! count 0)
               (cond ((eq? m 'withdraw) withdraw)
                     ((eq? m 'deposit) deposit)
                     (else (error "Unknown Request: make-account"
                                  m))))
        raise-error))
  dispatch)

(define acc1 (make-account 100 'so-secret)) ;; returns the dispatch procedure

((acc1 'so-secret 'withdraw) 10) ;; 90
((acc1 'so-secret 'withdraw) 20) ;; 70

((acc1 'wrong-pass 'withdraw) 80) ;; "Incorrect Password"

((acc1 'so-secret 'deposit) 45)
((acc1 'so-secret 'withdraw) 5) ;; 110

((acc1 'wrong-pass 'withdraw) 80) ;; "Incorrect Password"
((acc1 'wrong-pass 'withdraw) 80) ;; "Incorrect Password"
((acc1 'wrong-pass 'withdraw) 80) ;; "Incorrect Password"
((acc1 'wrong-pass 'withdraw) 80) ;; "Incorrect Password"
((acc1 'wrong-pass 'withdraw) 80) ;; "Incorrect Password"
((acc1 'wrong-pass 'withdraw) 80) ;; "Incorrect Password"
((acc1 'wrong-pass 'withdraw) 80) ;; "FBI OPEN UP!"
