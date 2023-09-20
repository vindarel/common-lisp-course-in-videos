
# You migth not need a macro!

If you want to return a result instead of manipulating s-expressions,
you might be thinking about your problem wrong, or you might be
rushing into using macros. Model your issue with functions first. Have
an example code that you wish to transform. Think syntactic
transformations, think the input is source code and the output is
source code.

Here are some examples taken on Stack Overflow so you can learn from others' misunderstandings.

## "How to return a statement from my macro"

>  I'm currently dealing with a minor problem regarding the definition of macros. Said macro should work as follows: It takes a list of numbers, creates a temporary (initially empty) list which is populated with the squared numbers and returns it. Unfortunately, I have some problems with this source code.

~~~lisp
(defmacro square_loop (args)
    (let ((res ()))
        (loop for x in args
            do (push (* x x) res))
        res))
~~~

https://stackoverflow.com/questions/75886966/common-lisp-how-to-return-statement

- **red flags**: "return", using the macro argument the same as a
  function argument, not using a macro mechanism (quote, backquote).

The answers might teach you something though, have a look.

## "I want to save me from writing a FORMAT because I have a lot of variables"

> I want to save me from writing a format like this because I have a lot of variables (more than 3) and want to insert a semicolon between them. I have defined a special variable and a macro.

> I have defined a special variable and a macro.

~~~lisp
(defparameter *delimiter* ";")

(defmacro format-delimited (stream fmt delimiter &body vars)
   (let ((fmtstr ""))
    (dotimes (i (length vars))
      (setf fmtstr (str:concat fmtstr fmt delimiter)))
    `(format ,stream ,fmtstr ,@vars)))
~~~

> This call ends in error:

~~~lisp
(format-delimited nil "~a" *delimiter* "a" "b" "c")

; Debugger entered on #<TYPE-ERROR expected-type: SEQUENCE datum: *DELIMITER*>
~~~

> Why?

https://stackoverflow.com/questions/77130744/using-a-macro-ends-in-error-when-using-a-special-variable/77132736

- **red flags**: returning something, trying to make a function call shorter, not manipulating s-expressions, passing a variable known only at run-time (`*delimiter*`) to the macro.
