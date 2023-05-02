# Scripting with batteries included

## Additional installation instructions

After you have downloaded the zip archive and extracted its content,
you need to put it somewhere so that your shell finds it. You can add its directory to your path or, what I suggest here, create a symlink into your `~/.local/bin/` directory, that probably is already in your `$PATH`:

    $ echo $PATH

Create a symlink:

    $ ln -s  /home/user/downloads/ciel-v0/bin/ciel  ~/.local/bin/ciel
    $ #                 ^^^^ where you unzipped the binary.

Now, you can call `ciel` from anywhere in your terminal.

    $ ciel --version

Try:

    $ ciel --help
    $ ciel -s simpleHTTPserver 9000

## Exercises

* do you understand the `(in-package :ciel-user)` expression? You
  might not, since we explain packages in chapter 5. But you can very
  well get an intuition for it. Try to run this:

```lisp
;; in myscript.lisp
(defparameter *hash-table* (make-hash-table))
(format t "my hash table: ~S" *hash-table*)

(defparameter *dict* (dict :a 1))
(format t "my dict: ~S" *dict*)
```

    $ ciel myscript.lisp

Does that work?

Now try with `in-package`:

```lisp
(in-package :ciel-user)

(defparameter *hash-table* (make-hash-table))
(format t "my hash table: ~S" *hash-table*)

(defparameter *dict* (dict :a 1))
(format t "my dict: ~S" *dict*)
```

* use the shebang line at the first line of your script, then try to load your file with CL's `load` or with your editor "compile buffer" command (`M-x slime-compile-file`, `C-c C-k` with Emacs and Slime): you should see an error.
  * do you understand the issue here?
  * follow the rabbit: read the Slime's function source, follow the sources to Swank's side (do you understand what are Slime and Swank? If not, that's alright for now).
  * find in CIEL's sources how we deal with loading a lisp file with a shebang line (which is not valide Lisp code).

* inspect what's inside CIEL. Use `apropos`! For example:

    $ ciel
    ciel-user> (apropos "random")

  <!-- * try also installating an external tool like [cl-livedocs](https://github.com/mmontone/cl-livedocs), a documentation browser to see what's inside the current Lisp image. -->

* create a scripts directory, add it to your PATH and write your first Lisp script for a daily task!


## The best of both worlds

You don't need an IDE to run other people's scripts nor to write
simple ones. But you'll need one quickly, if only to get symbols
completion (and to compile your code function per function and get
immediate feedback, and try them instantly on the REPL, and get the
interactive debugger… and all others nifty CL interactive features).

* download Portacle (as per the next video) or another Common Lisp IDE
  plugins (for Jetbrain, VSCode, Atom/Pulsar, Sublime, Vim…).
  * try writing a CIEL script step by step, interactively.
