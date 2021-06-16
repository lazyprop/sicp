Data is some collection of selectors and constructors that fulfil some
specified conditions in order to be a valid representation.

For example, `add-rat`, `mul-rat` etc are implemented in terms of `make-rat`,
`numer`, and `denom`. These three procedures fulfil the following condition:
```scheme
(define x (make-rat n d))
(= (/ (numer x) (denom x)
   (/ n d)))
```
Therefore `make-rat`, `numer` and `denom` are a valid representation for
rational numbers.

We can think of lower level objects like `cons` the same way. `cons`, `car` and
`cdr` are included as primitives in Scheme but any set of three procedures that
fulfils the following condition: 
```scheme
(define p (cons x y))
(= (car p) x)
(= (cdr p) y)
```
 Here is such an implementation without using any data structures but only
 procedures:
 ```scheme
(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (error "Argument not 0 or 1: CONS" m))))
  dispatch)

(define (car z) (z 0))
(define (cdr z) (z 1))
```

Since this satisifies the above condition, this is a valid representation of
pairs.

Note: Here `(cons x y)` returns the procedure `dispatch`. We are manipulating
the procedure directly like an object. This is called *message passing* (ch3).

`cons` can also be implemented like this:
```scheme
(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))
```
(ex 2.4)

This same method can be used to implement numbers.
