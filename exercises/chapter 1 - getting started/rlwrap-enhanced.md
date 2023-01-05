That is an addendum for the second video: "Run Lisp code from your terminal, write code with a simple text editor".

*disclaimer: use this only if setting up a proper development
environment is too hard or too long for you right now, only if you
want to try out SBCL on the command line.*

---

The [ReadLine Wrapper (rlwrap)](https://linux.die.net/man/1/rlwrap)
utility is actually a must have when you want to run SBCL from the
command line, because by default, SBCL in the terminal:

- doesn't offer symbol completion
- doesn't offer a history of commands
- doesn't even understand the arrow keys, left and right (they input
  `[[[A` instead), nor any default readline keybindings, the ones we
  find in bash et all: C-e, C-a, C-u, C-k, Alt-b, Alt-f etc.

We can actually fix this with rlwrap options.

We won't have *intelligent* code completion, that's for your editor that you will setup for proper CL development.
Those settings are here to help when you want to run a code snippet at the terminal.

The default terminal REPL of the CLISP implementation is way more user friendly, but this implementation is lagging behind, and not recommended for production or serious development. SBCL does much more.

## TAB-complete what you previously typed

Use `--remember / -r`. This allows to TAB-complete whatever you already typed. So, let's define a `hello` function:

```
$ rlwrap --remember sbcl
* (defun hello () :hello)
HELLO
* (hell <TAB>  <= completes "hello"
```

you can now TAB-complete "hell" to "hello". Awesome.

I made years before discovering that O_o RTFD, I know.

## TAB-complete built-in Lisp symbols

Provide a list of symbols in a file and use `-f / --file completions.txt`.

Here's a list with all Common Lisp built-in symbols, with ASDF and UIOP symbols, as well as Alexandria's: https://gist.github.com/alejandrogallo/d36a4b3b37586d19e54ce4cda8a7c47b

## Call an external editor to edit the current prompt

A multi-line input is tedious to write in readline. What if we called an external editor, so that when we close it,
the code is entered as if it was the prompt?

We can configure `readline` itself. Add in its `~/.inputrc` config file:

```
# in ~/.inputrc
"\C-xe":   rlwrap-call-editor            # CTRL-x e
```

It only works in conjunction with `--multi-line`.

Now use `C-x e` to call your editor defined in `RLWRAP_EDITOR`.

```
$ RLWRAP_EDITOR=vim/emacs/nano/gedit
$ rlwrap --multi-line='  ' sbcl
```

## TAB-complete files and directories

Use `-c / --complete-filenames`. Nice.

## Other required options

`-i`: completion is case insensitive.

`-b '()'`: parentheses delimit words. Or:

        --break-chars "(){}[],'#\";|\\"

`--quote-characters "\""`

## Everything together

In a sbcl.sh file:

```sh
#!/bin/bash

rlwrap -i -b '()' -f completions.txt [all options here] sbcl $*
```

## Terminal editors

At that point, let's try: cl-repl, sbcli, CIEL's repl, Lem… https://lispcookbook.github.io/cl-cookbook/editor-support.html
