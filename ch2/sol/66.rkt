#lang racket

(require "../btree-set.rkt")

(define (make-tree key val left right)
  (list key val left right))

(define (key st) (car st))
(define (value st) (cadr st))
(define (left-branch st) (caddr st))
(define (right-branch st) (cadddr st))

;; everything else is the same
