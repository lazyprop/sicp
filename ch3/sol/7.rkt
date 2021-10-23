#lang racket

(define (make-account balance secret-password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance
                     (- balance amount))
               balance)
        "Insufficient Funds"))

  (define (deposit amount)
    (set! balance (+ amount balance)))

  (define (raise-error . args)
    "Incorrect Password")

  (define (get-balance) balance)

  (define (dispatch pass m)
    (if (eq? pass secret-password)
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              ((eq? m 'balance) get-balance)
              (else (error "Unknown Request: make-account"
                           m)))
        raise-error))
  dispatch)

(define (make-joint orig-acc orig-pass new-pass)
  (define (raise-error . args)
    "Incorrect Password")

  (define (dispatch pass m)
    (if (eq? pass new-pass)
        (orig-acc orig-pass m)
        raise-error))
  dispatch)

(define peter-acc (make-account 100 'open-sesame)) ;; returns the dispatch procedure

(define paul-acc
         (make-joint peter-acc
                     'open-sesame
                     'rosebud))


((peter-acc 'open-sesame 'balance)) ;; 100
((paul-acc 'open-sesame 'balance))  ;; Incorrect Password
((paul-acc 'rosebud 'balance))      ;; 100

((paul-acc 'rosebud 'withdraw) 10)  ;; 90
((paul-acc 'rosebud 'balance))      ;; 90
((peter-acc 'open-sesame 'balance)) ;; 90

((peter-acc 'open-sesame 'withdraw) 10)  ;; 80
((peter-acc 'open-sesame 'balance))      ;; 80
((paul-acc 'rosebud 'balance))           ;; 80
