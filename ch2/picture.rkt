#lang racket
(require sicp-pict)

(define wave einstein)

#|
(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))
|#

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))


#|
(define (square-limit painter n)
  (let ((top-right (corner-split painter n)))
    (let ((top-half (beside (flip-horiz top-right)
                            top-right)))
      (below (flip-vert top-half) top-half))))
|#


;; Higher order applications
;; Generalizing everything (uncomment the earlier shitty hardcoded procedures)

;; generalize spliitting frame into four
(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter)
                       (tr painter)))
          (bottom (beside (bl painter)
                          (br painter))))
      (below bottom top))))

(define (flipped-pairs painter)
  (let ((combine4 (square-of-four identity
                                  flip-vert
                                  identity
                                  flip-vert)))
    (combine4 painter)))

(define (square-limit painter n)
  (let ((combine4
         (square-of-four flip-horiz
                         identity
                         rotate180
                         flip-vert)))
    (combine4 (corner-split painter n))))

;; generalize recursively splitting frame into half
(define (split h1 h2)
  (define (recur painter n)
    (if (= n 0)
        painter
        (let ((smaller (recur painter (- n 1))))
          (h1 painter
              (h2 smaller smaller)))))
  recur)

(define right-split (split beside below))
(define up-split (split below beside))

(paint (flipped-pairs wave))
(paint (right-split wave 3))
(paint (up-split wave 3))
(paint (corner-split wave 5))
(paint (square-limit wave 5))
