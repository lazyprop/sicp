(define (reversex l)
  (if (null? l)
      l
      (append (reversex (cdr l)) (car l))))
