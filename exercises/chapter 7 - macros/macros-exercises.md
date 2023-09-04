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
