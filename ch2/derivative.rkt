#lang racket

(provide (all-defined-out))

(define variable? symbol?)

(define (zero? x) (and (number? x)
                       (= 0 x)))

(define (one? x) (and (number? x)
                      (= 1 x)))

(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))

(define (make-sum a1 a2)
  (cond ((zero? a2) a1)
        ((zero? a1) a2)
        ((and (number? a1) (number? a2))
         (+ a1 a2))
        (else (list '+ a1 a2))))

(define (sum? x) (and (pair? x)
                      (eq? (car x) '+)))

(define (addend s) (cadr s))
(define (augend s)
  (if (null? (cddr s))
      0
      (cons '+ (cddr s))))


(define (make-product m1 m2)
  (cond ((one? m2) m1)
        ((one? m1) m2)
        ((or (zero? m1) (zero? m2)) 0)
        ((and (number? m1) (number? m2))
         (* m1 m2))
        (else (list '* m1 m2))))

(define (product? x) (and (pair? x)
                          (eq? (car x) '*)))

(define (multiplicand p) (cadr p))
(define (multiplier p)
  (if (null? (cddr p))
      1
      (cons '* (cddr p))))


(define (make-exponentiation b e)
  (cond ((zero? e) 1)
        ((one? e) b)
        ((one? b) 1)
        ((zero? b) 0)
        (else (list '** b e))))

(define (exponentiation? x) (and (pair? x)
                                 (number? (exponent x))
                                 (eq? (car x) '**)))

(define (base x) (cadr x))
(define (exponent x) (caddr x))

(define (deriv expr var)
  (cond ((number? expr) 0)
        ((variable? expr)
         (if (same-variable? expr var) 1 0))

        ;; sum rule
        ((sum? expr)
         (make-sum (deriv (addend expr) var)
                   (deriv (augend expr) var)))

        ;; product rule
        ((product? expr)
         (make-sum (make-product (multiplier expr)
                                 (deriv (multiplicand expr) var))
                   (make-product (multiplicand expr)
                                 (deriv (multiplier expr) var))))

        ;; power rule
        ((exponentiation? expr)
         (let ((u (base expr))
               (n (exponent expr)))
           (make-product (make-product n (make-exponentiation
                                          u (sub1 n)))
                         (deriv u var))))
        
        (else (error "unknown expression type: DERIV" expr))))


(define (tests)
  (define results (list (deriv '(+ (** x 2) (* 2 x) 1) 'x)
                        (deriv '(+ x x x) 'x)
                        (deriv '(* x y (+ x 3)) 'x)))
  (for ([res results])
    (displayln res)))

(tests)
