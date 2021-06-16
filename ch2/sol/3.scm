(define (make-point x y)
  (cons x y))

(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")")
  (newline))

(define (make-segment a b)
  (cons a b))

(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

#|
    p2---------p3
    |           |
    |           |
    p1---------p4
|#

(define (make-rect p1 p2 p3 p4)
  (list p1 p2 p3 p4))

(define (bottom-left rect) (car rect))
(define (top-left rect) (car (cdr rect)))
(define (top-right rect) (car (cdr (cdr rect))))
(define (bottom-right rect) (car (cdr (cdr (cdr rect)))))

;(define bottom-right (make-point (x-point top-right) (y-point bottom-left)))
;(define top-left (make-point (x-point botom-left) (y-point top-right)))

(define (dist p1 p2)
  (+ (abs (- (x-point p1) (x-point p2)))
     (abs (- (y-point p1) (y-point p2)))))

(define (length-rect rect) (dist (bottom-left rect) (bottom-right rect)))
(define (breadth-rect rect) (dist (bottom-left rect) (top-left rect)))

(define (perimeter rect) (* 2 (+ (length-rect rect) (breadth-rect rect))))
(define (area rect) (* (length-rect rect) (breadth-rect rect)))


#|
the alternate representation of the rectangle would require a reimplementaion
of either length and breadth procedures or bottom-left, top-left ... procedures
to work with the new implementation

the rest can be left to the area and perimeter procedures as they just depend
on the length and breadth procedures so it's easy to replace.

reimplementing would mess up this file and would require a lot of manual labour
i didn't sleep last night and it's 2AM. so i'm not i'm not going to do it.
|#

;; TEST

(define r (make-rect (make-point 0 0)
                     (make-point 0 4)
                     (make-point 4 6)
                     (make-point 6 0)))

(print-point (bottom-left r))
(print-point (top-left r))
(print-point (top-right r))
(print-point (bottom-right r))

(display (area r))
(newline)
(display (perimeter r))
(newline)
