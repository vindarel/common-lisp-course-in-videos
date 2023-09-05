
## GENSYM

This style of `--map` macros, where we capture the "it" symbol, is
called "anaphoric macros".

Here's an example:

~~~lisp
(defmacro --map (form list)
  `(mapcar (lambda (it)
            ,form)
     ,list))
~~~

- see the Anaphora library on Quicklisp
  - (I don't advise to use it in your projects, not a widespread style)
- simpler example in [dash.el](https://github.com/magnars/dash.el)

---

About lambda shortcuts

Here's another lambda shortcut:

~~~lisp
;; from Bard
(defmacro ^ (&rest forms)
  `(lambda ,@forms))
~~~

Usage:

~~~lisp
(mapcar (^ (it) (* 2 it)) '(2 3))
~~~

It's just a shortcut to "lambda".

See also

* [fn](https://github.com/cbaggers/fn) - a couple of lambda shorthand macros. `(fn* (+ _ _))  -->  (lambda (_) (+ _ _))`.
* [f-underscore](https://gitlab.common-lisp.net/bpm/f-underscore) - a tiny library of functional programming utils. `(f_ (+ _ _)) -> (lambda (_) (+ _ _))`.
* [cl-punch](https://github.com/windymelt/cl-punch/) - Scala-like anonymous lambda literals. `(mapcar ^(* 2 _) '(1 2 3 4 5))` (the shortest of all?)

I like lambda shortcuts but really, just write short functions and use `mapcar #'shortfunction list` ;)

### string-case

You could start by manipulating forms like this and experiment:

~~~lisp
(defparameter forms '(
  ("x" (print "that's x"))
  ("test" (print "that's my test!"))
  (t (print "nevermind"))))
~~~

What's the result of this?

```lisp
(loop for form in forms
  if (equal "test" (first form))
  collect (second form))
```

You could loop over them and collect some expressions to form the body of COND:

~~~lisp
(let ((s "test"))
(loop for form in forms
      collect
         `((equal s ,(first form))
           ,(second form)))
)
~~~

then you would need to wrap this inside a COND, use ,@ to remove a
level of parens of the loop, check you handle a string (and not T).

Can you run this?

~~~lisp
`(cond
  ,@(loop for form in forms
      collect
         `((equal s ,(first form))
           ,(second form))
          ))
~~~

Look for a solution in str:string-case (quickload "str").
