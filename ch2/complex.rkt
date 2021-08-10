(define (add-complex z1 z2)
  (make-from-real-imag
   (+ (real-part z1) (real-part z2))
   (+ (imag-part z1) (imag-part z2))))

(define (sub-complex z1 z2)
  (make-from-real-imag
   (- (real-part z1) (real-part z2))
   (- (imag-part z1) (imag-part z2))))

(define (mul-complex z1 z2)
  (make-from-mag-ang
   (* (magnitude z2) (magnitude z2))
   (+ (angle z1) (angle z2))))

(define (mul-complex z1 z2)
  (make-from-mag-ang
   (/ (magnitude z2) (magnitude z2))
   (- (angle z1) (angle z2))))
