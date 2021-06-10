(define (pascal r c)
  (if (or (= c 1) (= c r))
      1
      (+ (pascal (- r 1) (- c 1))
         (pascal (- r 1) c))))

(define (pascal-tri n)
  (define (rows r)
    (define (cols c)
      (cond ((> c r) ())
            (else
              (display (pascal r c))
              (display " ")
              (cols (+ 1 c)))))

    (cond ((> r n) ())
          (else
            (cols 1)
            (newline)
            (rows (+ 1 r)))))
  (rows 1))

(pascal-tri 10)
