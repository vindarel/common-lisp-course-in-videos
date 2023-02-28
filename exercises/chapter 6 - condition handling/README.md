
# Exercises

## Using HANDLER-CASE

You are writing a library that does an HTTP request.

1. do the request in a simple function, that is simply a wrapper around `dex:get`.
2. write another function that calls this first one, but that handles the max of conditions you can think of:
   - handle usocket errors (host not found…)
   - handle Dexador errors (handle 400, 404 and 500 error codes)
   - handle any other error
3. if you catch any other unexpected error, return a condition of yours and give the maximum context inside custom slots.
4. find a way to have automated tests. Even if you don't setup a test framework like FiveAM yet, have some code that mimicks network errors, without actually calling the `dex:get` function, and have assertions that check that you get the expected result.
   - how do you programmatically check that an error was signaled, how do you run all tests without stopping at the first error? You're closer to wanting a test framework…
   - when you run the tests from the CLI, be sure to return the error code 1 in case of errors.

## MY-IGNORE-ERRORS

The `ignore-errors` macro is easily constructed with `handler-case`: catch all errors and return two values: NIL and the condition object.

You can try this pattern in your code and ensure that you don't see any difference with `ignore-errors`.

But, if you want to factor out the pattern, you'll quickly realize that you need to do it with a macro. What you can do now is do it with a function, and realize it doesn't work.

Writing the macro is for another chapter. But, jump at `ignore-errors`' definition to see that it is a simple macro. Hint: you don't need `sb-xc:defmacro` but simply `defmacro`.

## HANDLER-BIND

### Handling user notifications with HANDLER-BIND

You use a third-party library that sends signals about the ongoing
program state. You want to be notified about them and to display them
to the end user (in that case, you). You also want to control this
possibility with a parameter of your own code.

Another way to put it: you write a library and you want to decouple
the signaling of this additional and optional information to its
handling part.

1. Create a new package. We will write a simple function that `signal`s conditions while it is processing data, and that signals another one when it is finished.
2. Inside this package, create a "notification" condition, with a `message` slot. Give it an `:initarg`, an `:initform`, an `:accessor`.
   - the initform is optional. Try without it and see if or when you'll need a check about the slot's existence with `slot-boundp`.
3. Create a new "end-of-operation" condition that inherits "notification".
4. Create a dummy function that loops a small number of times, signals a notification at each iteration, and signals an "end-of-operation" in the end. You can use `dotimes` and `sleep` inside it.

Example:

~~~lisp
(in-package :your-package)

(defun loop-and-signal (&optional (n 3))
  (dotimes (i n)
     (sleep 1)
     ;; SIGNAL a condition here
  ;; and another in the end.
  ))
~~~

Now come back to CL-USER (or to a new package again).

Your `main` function calls the dummy one. By default, do nothing:

~~~lisp
(defun main ()
    (your-package:loop-and-signal))
~~~

What should happen? Do you expect to see the notifications?

Use `handler-bind` to handle all notifications. Write most of the
handling logic in another "handle-notification" function, not in a
lambda function.

You can nicely show messages to a end user with `notify-send` on GNU/Linux. For example:

~~~lisp
(uiop:launch-program (list "notify-send" "Title"
                           (format nil "~a"
                                   … ;; message
                                   )))
~~~

You can simply print to stdout.

Use a parameter to control if you display notifications or not.

### Rocks and sand simulation

Be sure to check the example from Advent of Code 2022 that we linked to under our HANDLER-BIND video.

It uses [Sketch](https://github.com/vydd/sketch/) to visually show
rocks and a progression of sand grains. It uses `signal` and
`handler-bind` to gather the new sand and reactively re-draw them. Try it!


### Handling unexpected signals

Imagine the internal `loop-and-signal` signals a condition for
something that was unexpected: not enough disk space, a bad date (or
any data in a bad shape)… it isn't that big of a deal so it won't crash (it's
only a simple condition, not an error), and it wants to let the user
decide what to do about it.

1. Create another condition, and signal it.
2. In the main function, handle it, and invoke the interactive debugger.
3. Add a parameter: if we are not in testing mode, log the error instead and don't invoke the debugger.
   1. Do as we saw: `handler-bind` inside of `handle-case`.

Wouldn't it be nice, when we are in testing mode and we get the
debugger, that we had custom choices for how to handle this specific
condition? That's where handlers get handy.

They would help for errors too. For example, if a database connection
is not open, have a restart to connect to our DB. This helps during
development, and with live systems.

### HTTP retries with Dexador

Use the [Dexador](https://github.com/fukamachi/dexador/) library to
send HTTP requests to a dummy domain that doesn't exist, to make requests fail.

1. Handle a "400 bad request" with a `handle-case` and log the call.
2. Do the same with `handler-bind`.
3. Retry 3 times, logging each call. When it definitely fails, print a stacktrace.

Handle all Dexador errors. Recall the Usocket conditions of earlier, and handle them.
