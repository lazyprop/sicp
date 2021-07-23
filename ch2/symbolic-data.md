The ability to quote an object lets us treat that object as data. If we want to
construct a list `(a, b)` we cannot do `(list a b)` as that will construct a
list containing the *values* of `a` and `b`. This is because of the evaluation
model of Scheme where arguments are evaluated before being passed.

This issue has an analog in the context of natural languages:
"Say your name out loud" and "Say 'your name' out loud"
This problem is solved using *quotation*.

```scheme
(define a 1)
(define b 2)
(list a b) ;; (1 2)
(list 'a 'b) ;; (a b)
(list 'a b) ;; (a 2)
```

Being able to quote symbols and lists gives us the ability to treat them as data
instead of expressions to be evaluated. 
