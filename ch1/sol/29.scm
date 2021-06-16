(define (cube x)
  (* x (square x)))

(define (y a k h)
  (cube (+ a (* k h))))

(define (term k)
  (* (cond ((= k 0) 1)
           ((= k n) 1)
           ((even? k) 2)
           (else 4))
     (y a k h)))

(define (sum term a next b)
  (if (> a b) 0
      (+ (term a) (sum (next a) next b))))

(define (integral f a b dx)
  (define h (/ (- b a) n))
  (define (y k)
    (f (+ a (* k h))))
  (define (add-dx x)
    (+ x dx))

  (/ (* h
        (sum 
