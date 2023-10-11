# Macros exercises

## QUOTE

### Play around with `quote` or `'`, the single quote character.

Write any lisp code, quote it and observe.

```lisp
(list 1 2 3)
```
and quote it:

```lisp
(quote (list 1 2 3))

;; or
'(list 1 2 3)
```

More:

```lisp
(defun foo () :hello)
```

and quote this.


### quoting quotes

Type:

~~~lisp
(quote '(1 2 3))
~~~

then

~~~lisp
'(quote (1 2 3))
~~~

what do you see?

Type

~~~lisp
''a
~~~

then

~~~lisp
(quote (quote a))
~~~


### Quote variables and other symbols

Try by yourself that creating this list, where we don't know the values of A and B, fails:

```lisp
(list A 1 B 2)
```

but if you quote the expression, you get a result.

You could quote each individual symbol:

```lisp
(list 'A 1 'B 2)
```

but that's something else. A quote in front of everything is enough to quote the whole expression.


### Play with EVAL

We do **not** use EVAL much, if at all, in real-world programs. However, to understand the effect of QUOTE, and the basics of symbolic manipulation, play with it.

> Showed at 2'14 in the video

Start with this:

```lisp
(defun foo () :hello)
```

then quote everything, then use EVAL to re-define `foo`.


### Knowing QUOTE better

Does this work?

```lisp
(quote
   (defun hello () :test)
   (print "calling hello…")
   (hello))
```

Read the spec: https://cl-community-spec.github.io/pages/quote.html

Do you get a better idea why, in Lisp, code quickly becomes data?

### QUOTE warning (advanced)

There is an "undefined behaviour" warning in the spec.

What you don't know, is that the CL specification allows a compiler to
treat quoted lists as constants. Moreover, a compiler can optimize
things out and share a single place for constants in memory, even when
they are declared in different locations in the code base. So, if you
use a quoted list as a variable in your code and later modify it, this
same quoted list, used in an un-related part of your code, could be
impacted by the change. And you would get a subtle bug.

The conclusion is to *not* create data structures with QUOTE when a
built-in function like `list` suffices. Do not use QUOTE to create
variables. We talk about it in the backquote and comma video too.

QUOTE is **not** a list constructor.

On the topic, remember that CL has a few destructive operators:
`replace`, `delete` (when `remove` is not destructive), `sort` (so,
use `copy-seq` or `copy-list` before using it), and other functions
named with a starting "n", like `nreverse`. See the [Cookbook, "data
structures"](https://lispcookbook.github.io/cl-cookbook/data-structures.html). It's
wise to avoid them and use the non-destructive ones.

## Backquote and comma

### Basics

Replace the LIST constructor with backquote and comma, as in the video:

~~~lisp
(let ((a 1)
      (b 2))
  (list :a a :b b))
~~~

But remember the quote warning: this is an exercise, you should keep
using LIST, until you know what you do ;)

### cons cells (macros detour)

As in the video again, transform this with backquote and commas:

~~~lisp
(list (cons :a 1)
      (cons :b 2))
~~~

First, evaluate it and observe how the cons cell is printed
(represented) with a dot.

Evaluate this:

~~~lisp
(cons :a nil)
~~~

and this:

~~~lisp
(cons :a (cons :b nil))
~~~

How is it printed? Still with a dot? You are seeing a Lisp printer
convention: when a cons cell ends with NIL, it represents a list, and
is printed without a dot. You can find this in the Cookbook.

### Build HTTP headers

Quickload the Dexador library and create headers, using a list of cons
cells as in the video. Use `:verbose t` to see them printed on the
REPL.

Have a look at the awesome-cl list for other solutions to send emails
in CL. Optionally, do a quick GitHub search about them.

### Trap question

Do you think you can replace this with a backquote and comma?

~~~lisp
(let ((a 1))
  (format t "the value of a is ~a" a))
~~~

of course no.

Beginners fall in the common trap to over-complicate things, to think
that quote and backquote are the crux of Common Lisp development. Be
careful. Your goal is to use functions, instead of macros, as much as
possible. See the video "functions VS macros".

You might not need a macro yet ;)

## Macros parameters

### Practice

Practice the examples of the video, write the two macros:

~~~lisp
(dolist x (list …) …)
;; and
(dolist (x (list …)) …)
~~~

### Re-implement usual macros

Implement `when`, `if` (call them "my-whem", "my-if", or better:
create a package that shadows the built-in symbols). Yes, you can use
the built-in cl:if.

Implement a `while` macro.

Its lambda list will be: `(while test <body forms>)`.

Example use:

~~~lisp
(let ((x 0))
  (while (< x 3)
    (print 'hello)
    (setf x (incf x))))
~~~

You can use the almighty `loop` for this (it has an appropriate clause).

Be sure to check the macro expansions.

These macros are simple, but you must practice.


## GENSYM

### Practice

Practice all what we saw in the video ;)

### OR

Write your own `or` macro. Let's say it accepts only two arguments.

~~~lisp
(my-or 1 2)
~~~

It must: bind the first argument to a temporary variable, check it for
truthiness, if true return it, otherwise return the second argument.

You can `macroexpand` an `or` expression to have an idea:

    (macroexpand '(or 1 2))


### Intended variable capture

What if sometimes, we *wanted* to capture symbols inside our macro?

Here's a use case, where `--map` is our macro:

~~~lisp
(--map (+ 10 it) '(1 2 3))
;; =>
;; (11 12 13)
~~~

instead of:

~~~lisp
(mapcar (lambda (x)
         (+ 10 x))
     '(1 2 3))
~~~

Accordingly, the "--map" macro isn't really Common Lisp style, even
though there is complete library with this style of macros. We see
this more in Elisp.

Create the `--map` macro.

Solution in the other file.

### string-case (difficult)

This one is more difficult: implement a `string-case` macro. Like
`case`, but working for strings.

Example use:

```lisp
(defparameter s "test")

(string-case s
  ("x" (print "that's x"))
  ("test" (print "that's my test!"))
  (t (print "nevermind")))
```

Its form is: `(string-case <string variable> <forms>)` and forms are
two-tuples: the first element is a string, the second is a form to
execute when the two strings match.

The real question is: what final code do we want to generate?
Reminder: `s` is a variable that will be known at run time, not
compile time. A possibility is to build a `cond` of this form:

```lisp
(cond
  ((equal s <first form element>)
    <second form element>)
  ;; and so on for each form)
```

So this is our initial need, better formulated: imagine we were
writing a bunch of "(cond ((equal s…" code, and we want to create a
shorter construct. We want to go from:

```lisp
(cond
  ((equal s "test")
   (print "my test!"))
  (t (print "nevermind")))
```

to

```lisp
(string-case s
  ("test" (print "my test!"))
  (t (print "nevermind")))
```

In the second snippet we have less repetition, and we use a well-known
case-like construct. So, our goal is to start with expressions from
string-case and generate expressions for COND.

You'll need to generate a COND, iterate on the forms, assemble new
"((equal s <string>) <body>)" clauses, not forgetting to handle the
form with `t` (that doesn't need an equality test).

You might need a gensym. You can quote an expression inside a ,@.

Reminder: the macro doesn't "return" a result, it assembles and
generates lists of s-expressions.

Start with the final code that you want to generate. Manipulate a list
of forms outside the macro.  Adding "quote" in full letters step by
step might help. Does the call-will- pattern help you?
