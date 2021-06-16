(random-source-randomize! default-random-source)

(define (inc x) (+ x 1))
(define (identity x) x)

(define (smallest-div n)
  (define (divides? a b)
    (= 0 (remainder b a)))
  (define (find-div n test)
    (cond ((> (square test) n) n) ((divides? test n) test)
          (else (find-div n (+ test 1)))))
  (find-div n 2))


(define (prime? n) 
 (if (= n 1) false (= n (smallest-div n)))) 

(define (coprime? a b)
  (= (gcd a b) 1))

(define (filt-acc pred? combiner null-val term a next b)
  (cond ((> a b) null-val)
        ((not (pred? a)) 
         (filt-acc pred? combiner null-val term (next a) next b))
        (else (combiner (term a) (filt-acc pred? combiner null-val term
                                           (next a) next b)))))

(define (prime-sq-sum a b)
  (filt-acc prime? + 0 square a inc b))

(define (coprime-prod n)
  (define (filter a)
    (coprime? a n))
  (filt-acc filter * 1 identity 1 inc n))

(display (prime-sq-sum 1 100))
(newline)

(display (coprime-prod 10))
(newline)
