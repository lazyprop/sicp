#lang racket

(define (rand)
  (define val 0) ;; this probalby shouldn't be zero
  (define (rand-update x) (add1 x)) ;; this definitely shouldn't be this

  (define (dispatch m . args)
    (cond ((eq? m 'generate)
           (let ((r (rand-update val)))
             (set! val r)
             r))
          ((eq? m 'reset)
           (set! val (car args)))
          (else (error "Unknown message: rand"
                       m))))
  dispatch)

(define rng (rand))
(rng 'generate)
(rng 'generate)
(rng 'generate)

(rng 'reset 24)
(rng 'generate)
(rng 'generate)


(define (factorial n)
  (let ((product 1)
        (counter 1))
    (define (iter)
      (if (> counter n)
          product
          (begin (set! product (* counter product))
                 (set! counter (add1 counter))
                 (iter)))))
  (iter))
