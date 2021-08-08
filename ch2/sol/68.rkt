#lang racket

(require "../huffman.rkt")

(define sample-tree
  (make-tree 
   (make-leaf 'A 4)
   (make-tree
    (make-leaf 'B 2)
    (make-tree 
     (make-leaf 'D 1)
     (make-leaf 'C 1)))))

(define sample-message 
  '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(define (is-in-branch? symbol branch)
  (define (iter st)
    (cond ((null? st) #f)
          ((eq? symbol (car st)) #t)
          (else (iter (cdr st)))))
  (iter (symbols branch)))

(define (get-branch-chooser symbol tree)
  (if (is-in-branch? symbol (left-branch tree))
      left-branch
      right-branch))

(define (encode-symbol symbol tree)
  (if (leaf? tree)
      null
      (let ((branch-chooser
             (get-branch-chooser symbol tree)))
        (let ((res (encode-symbol symbol (branch-chooser tree))))
          (if (eq? branch-chooser left-branch)
              (cons 0 res)
              (cons 1 res))))))

(define (encode message tree)
  (if (null? message)
      null
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(encode (decode sample-message sample-tree) sample-tree)
