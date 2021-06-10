(define (sum-of-squares a b) (+ (* a a) (* b b)))

(define (f a b c)
  (if (> a b)
      (if (> a c)
          (sum-of-squares a (max b c))
          (sum-of-squares c (max a b)))
      (sum-of-squares b (max a c))))
