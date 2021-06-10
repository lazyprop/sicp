(define (cc amount kind)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kind 0)) 0)
        (else (+ (cc amount (- kind 1))
                 (cc (- amount (denom kind)) kind)))))

(define (denom n)
  (cond ((= n 1) 1)
        ((= n 2) 5)
        ((= n 3) 10)
        ((= n 4) 25)
        ((= n 5) 50)))

(define (count-change amount) (cc amount 5))

(display (count-change 100))
