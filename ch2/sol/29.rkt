#lang racket

(define (make-mobile left right)
  (list left right))

(define (make-branch len structure)
  (list len structure))

(define (left-branch mobile)
  (car mobile))

;; in the cons implementation this would just be
;; (cdr mobile)
(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

;; in the cons implementation this would just be
;; (cdr branch)
(define (branch-structure branch)
  (car (cdr branch)))


(define (total-weight mobile)
  (if (not (pair? mobile))
      mobile
      (+ (total-weight (branch-structure (left-branch mobile)))
         (total-weight (branch-structure (right-branch mobile))))))

(define (torque branch)
  (* (branch-length branch)
     (total-weight (branch-structure branch))))

(define (balanced? mobile)
  (if (not (pair? mobile))
      #t
      (and
       (balanced? (branch-structure (left-branch mobile)))
       (balanced? (branch-structure (right-branch mobile)))
       (= (torque (left-branch mobile))
          (torque (right-branch mobile))))))

(define x (make-mobile (make-branch 2 3) (make-mobile 2 3)))

(left-branch x)
(right-branch x)
(branch-length (left-branch x))
(branch-structure (left-branch x))

(total-weight x)

(balanced? x)
(balanced? (make-mobile (make-branch 10 x) (make-branch 12 5)))
