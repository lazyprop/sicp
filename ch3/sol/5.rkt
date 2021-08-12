#lang racket

(require "../monte-carlo.rkt")

(define (random-in-range lo hi)
  (let ((range (- hi lo)))
    (+ lo (* range (random)))))

(define (estimate-integral p x1 y1 x2 y2 trials)
  (define (experiment)
    (define rx (random-in-range x1 x2))
    (define ry (random-in-range y1 y2))
    (p rx ry))
  (* (monte-carlo trials experiment)
     (* (abs (- x1 x2))
        (abs (- y1 y2)))))

(define (square x) (* x x))

(define (check cx cy r)
  (lambda (x y)
    (<= (+ (square (- x cx)) (square (- y cy)))
        (square 3.0))))

(estimate-integral (check 5.0 7.0 3.0)
                   2.0 4.0 8.0 10.0
                   100000)
