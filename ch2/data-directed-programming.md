# Type Tags, Generic Operations and Data Directed Programming

> One way to view data abstraction is as an application of the "principle of least commitment".

In order to distinguish between different types, we include a 'type tag' with
each object.

```scheme
;; attach type to datum
(define (attach-tag type-tag contents)
  (cons type-tag contents))

;; return type tag of datum
(define (type-tag datum)
  (if (pair? datum)
      (car datum)
      (error "Bad tagged datum: type-tag"
             datum)))

;; return contents of datum after removing type tag
(define (contents datum)
  (if (pair? datum)
      (cdr datum)
      (error "Bad tagged datum: contents"
             datum)))
```

Example use of type tags:

```scheme
(define (rectangular? z)
  (eq? (type-tag z) 'rectangular))
```

Section 2.4.3 describes a lookup table as a strategy for efficient dispatching.
Each entry in the table are procedures that implements each operation on each
type.

```
| Operation | Polar           | Rectangular           |
| _________ | _______________ | _____________________ |
| real-part | real-part-polar | real-part-rectangular |
| magnitude | magnitude-polar | magnitude-rectangular |
```

Instead of checking for the type tags in each generic procedure, we can use
a single procedure for implementing the interface. The procedure will look up
the combination of operation name and argument type to find the correct
procedure to apply.

To do this we need two procedures `put` and `get`:
- `(put op type item)`: install `item` in table at `(op, type)`
- `(get op type)` get item at `(op, type)`. Return `#f` if no item.

*Note:* The implementaion of `put` and `get` is described in Chapter 3

Now we can define polar and representations in seperate packages and use `put`
to interface with the rest of the system
Example:

```scheme
(define (install-polar-package)
  ;; interal procedures
  (define (magnitude z) (car z))
  (define (angle z) (cdr z))
  (define (real-part z)
    (* (magnitude z) (cos (angle z))))

  ;; interface to the system
  (define (tag x) (attach-tag 'polar x))
  (put 'magnitude '(polar) magnitude)
  (define 'real-part '(polar) real-part))
```

*Note:* Here the type tags are implemented as a list to give us the freedom to
choose to have multi-type operations.

To implement the generic interface, we need to define a procedure
`apply-generic`, which looks up the table for some operation and types of
arguments and apply the resulting procedure to arguments.

```scheme
(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (error "No method defined for these tyeps: apply-generic"
                 (list op type-tags))))))
```

Now we can implement our generic selectors like this: 
```scheme
(define (real-part z) 
  (apply-generic 'real-part z))
```
