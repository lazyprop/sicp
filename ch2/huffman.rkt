#lang racket

(provide (all-defined-out))

(define (make-leaf symbol weight)
  (list symbol weight 'leaf))

(define (leaf? node) (eq? (caddr node) 'leaf))
(define (symbol-leaf leaf) (car leaf))
(define (weight-leaf leaf) (cadr leaf))
(define (make-tree left right)
  (list left
        right
        (append (symbols left)
                (symbols right))
        (+ (weight left)
           (weight right))))

(define (left-branch node) (car node))
(define (right-branch node) (cadr node))

(define (symbols node)
  (if (leaf? node)
      (list (symbol-leaf node))
      (caddr node)))

(define (weight node)
  (if (leaf? node)
      (weight-leaf node)
      (cadddr node)))

(define (choose-branch bit)
  (cond ((= bit 0) left-branch)
        ((= bit 1) right-branch)
        ;; higher order procedures yeah let's gooooo!!!
        (else (error "bad bit: CHOOSE-BRANCH") bit)))

(define (decode bits tree)
  (define (iter bits cur-branch)
    (if (null? bits)
        null
        (let ((next-branch
               ;; higher order function application brrrrrr
               ((choose-branch (car bits)) cur-branch)))

          (if (leaf? next-branch)
              ;; start again from the entire tree
              (cons (symbol-leaf next-branch)
                    (iter (cdr bits) tree))
              ;; else we just need the branch that corresponds to our bit
              (iter (cdr bits) next-branch)))))
  (iter bits tree))

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

(define (adjoin-set x st)
  (cond ((null? st) (list x))
        ((< (weight x) (weight (car st)))
         (cons x st))
        (else (cons (car st)
                    (adjoin-set x (cdr st))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      null
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf
                     (car pair)   ;; symbol
                     (cadr pair)) ;; frequency
                    (make-leaf-set (cdr pairs))))))

(define (successive-merge nodes)
  (cond ((null? nodes) null)
        ((null? (cdr nodes)) (car nodes))
        (else (successive-merge (adjoin-set
                                 (make-tree (car nodes)
                                            (cadr nodes))
                                 (cddr nodes))))))

(define (generate-huffman-tree pairs)
  (successive-merge
   (make-leaf-set pairs)))
