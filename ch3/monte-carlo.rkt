#lang racket

;; the probability that two integers chosen at random is 6/pi^2
;; see: http://www.pi314.net/eng/cesaro.php
(define (cesaro-test)
  (= (gcd (rand) (rand)) 1))

(define (estimate-pi trials)
  (sqrt (/ 6 (monte-carlo trials
                          cesaro-test))))

(define (rand) (random 1000000))

;; rand should be defined differently in terms of rand-update
;; but rand-update is not predefined and i'm too lazy to look up the
;; implementation of random number generators

(define (monte-carlo trials experiment)
  (define (iter remaining passed)
    (cond ((= remaining 0) (/ passed trials))
          ((experiment) (iter (sub1 remaining)
                              (add1 passed)))
          (else (iter (sub1 remaining)
                      passed))))
  (iter trials 0))
(provide monte-carlo)
