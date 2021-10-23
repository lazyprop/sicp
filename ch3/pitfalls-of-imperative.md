Programs written in the imperative style are susceptible to bugs that simply
cannot occur in the functional style: order of execution. Consider a factorial
function:

```racket
(define (factorial n)
  (define (iter product counter)
    (if (> counter n)
        product
        (iter (* counter product)
              (add1 counter))))
  (iter 1 1))
```

If we rewrite this program in an imperative style:

```racket
(define (factorial n)
  (let ((product 1)
        (counter 1))
    (define (iter)
      (if (> counter n)
          product
          (begin (set! product (* counter product))
                 (set! counter (add1 counter))
                 (iter)))))
  (iter))
```

Now the order of execution matters.

```racket
(set! counter (+ counter 1))
(set! product (* counter product))
```
is different from 
```racket
(set! product (* counter product))
(set! counter (+ counter 1))
```

This issue does not arise in the case of functional programming. This makes it
very easy to reason about programs written in an FP style.

This becomes an even bigger problem in concurrent programs.

See [this paper](http://dspace.mit.edu/handle/1721.1/5753) by Guy Steele Jr.
Debunking the 'Expensive Procedure Call' Myth, or Lambda: the Ultimate GOTO
Why aren't beginners taught in the functional style? 
