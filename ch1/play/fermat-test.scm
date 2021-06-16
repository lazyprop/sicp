; fermat's little theorem: a^p is congruent to a (mod p)

; apparently this is required to get random seed each time
(random-source-randomize! default-random-source)

(define (expmod a n m)
  (cond ((= n 0) 1)
        ((even? n)
         (remainder (square (expmod a (/ n 2) m)) m))
        (else
          (remainder (* a (expmod a (- n 1) m)) m))))

(define (fermat-test n)
  (define (try a)
    (= (expmod a n n) a))

  (try (+ 0 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(display (fermat-test 101))
(newline)
