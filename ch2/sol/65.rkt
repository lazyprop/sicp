#lang racket

(define (make-tree entry left right) (list entry left right))
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))

;; O(n) if the tree is balanced
(define (element-of-set? x st)
  (cond ((null? st) #f)
        ((= x (entry st)) #t)
        ((< x (entry st) (element-of-set? x (left-branch st))))
        (else (element-of-set? x (right-branch st)))))

;; O(n) if the tree is balanced
(define (adjoin-set x st)
  (cond ((null? st) (make-tree x null null))
        ((= x (entry st)) st)
        ((< x (entry st)) (make-tree (entry st)
                                     (adjoin-set x (left-branch st))
                                     (right-branch st)))
        (else (make-tree (entry st)
                         (left-branch st)
                         (adjoin-set x (right-branch st))))))

(define (tree->list tree)
  (if (null? tree)
      '()
      (append 
       (tree->list 
        (left-branch tree))
       (cons (entry tree)
             (tree->list 
              (right-branch tree))))))

(define (list->tree elements)
  (car (partial-tree 
        elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size 
             (quotient (- n 1) 2)))
        (let ((left-result 
               (partial-tree 
                elts left-size)))
          (let ((left-tree 
                 (car left-result))
                (non-left-elts 
                 (cdr left-result))
                (right-size 
                 (- n (+ left-size 1))))
            (let ((this-entry 
                   (car non-left-elts))
                  (right-result 
                   (partial-tree 
                    (cdr non-left-elts)
                    right-size)))
              (let ((right-tree 
                     (car right-result))
                    (remaining-elts 
                     (cdr right-result)))
                (cons (make-tree this-entry 
                                 left-tree 
                                 right-tree)
                      remaining-elts))))))))


(define (ordered-list-union set1 set2)
  ;; (< (car lo) (car hi))
  ;; only hi can be null
  (define (f lo hi)
    (if (element-of-ordered-list? (car lo) (cdr lo))
        (ordered-list-union (cdr lo) hi)
        (cons (car lo) (ordered-list-union (cdr lo) hi))))

  (cond ((and (null? set1) (null? set2)) null)
        ((null? set1) (f set2 set1))
        ((null? set2) (f set1 set2))
        ((= (car set1) (car set2)) (ordered-list-union set1 (cdr set2)))
        ((< (car set1) (car set2)) (f set1 set2))
        (else (f set2 set1))))

(define (element-of-ordered-list? x st)
  (cond ((null? st) #f)
        ((> (car st) x) #f)
        ((= (car st) x) #t)
        (else (element-of-ordered-list? x (cdr st)))))

(define (union-set set1 set2)
  (list->tree (ordered-list-union (tree->list set1)
                                  (tree->list set2))))

(define s1 (list 1 3 5 7 9 11))
(define s2 (list 3 4 5 6 7 8))

(list->tree s1)
(list->tree s2)

(tree->list (list->tree s1))
(tree->list (list->tree s2))

(tree->list (union-set (list->tree s1)
                       (list->tree s2)))
