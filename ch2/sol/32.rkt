#lang racket

(define (subsets s)
  (if (null? s)
      (list null)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (ss)
                            (cons (car s) ss))
                          rest)))))

;; we recursively generate subsets of the cdr of the list in `rest`
;; for each subset in `rest`, we cons (car s) to that subset
;; if the list is null, we return a list containing an empty list: '(())


(subsets (list 1 2 3))
