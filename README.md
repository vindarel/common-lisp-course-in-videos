🕊

<p>
  <h2 align="center"> Common Lisp Programming Course </h2>
  <h3 align="center"> Learn Lisp effectively, in videos </h3>
</p>

<p align="center">
  <a href="https://www.udemy.com/course/common-lisp-programming/?referralCode=2F3D698BBC4326F94358"><b> Homepage </b></a> |
  <a href="https://lisp-journey.gitlab.io/"><b> Blog </b></a> |
  <a href="https://twitter.com/vindarel"><b> Twitter </b></a> |
  <a href="https://ko-fi.com/vindarel"><b>Buy me a coffee!</b></a>

  <h4> Learn the Lisp language and its ecosystem, become an effective programmer and learn how to write real-world applications. Avoid all the traps that I faced during my journey! </h4>

</p>

Guys and girls, I really like Common Lisp, it is superior to many
languages out there (hello Python), but learning it isn't as easy as
it should be. Despite very good books, there aren't many online
resources, the language has its peculiarities, the ecosystem is
larger than you think but not well structured. I contributed a *lot*
to written resources such as the
[Cookbook](https://lispcookbook.github.io/cl-cookbook/),
[awesome-cl](https://github.com/CodyReichert/awesome-cl) and my
[lisp-journey blog](https://lisp-journey.gitlab.io/) but I want to do more.

You can now **learn Common Lisp with my [videos on the Udemy platform](https://www.udemy.com/course/common-lisp-programming/?referralCode=2F3D698BBC4326F94358)**. At the time of writing, I consider it half done (but the chapters there are complete). If you subscribe now, you'll have access to the new content that I'm working on. I truly believe this course to be **the most effective way to learn Common Lisp today**. I am genuinely happy to share all that with you.

This course is the result of my experience writing new material,
answering questions, writing libraries, software, demos, starter kits
and using CL in production© [^1]. I run my own small business [^2].

*Here's a [60% coupon for June, 2022](https://www.udemy.com/course/common-lisp-programming/?couponCode=SUMMER-LISP-2206).* *If you are a student, drop me a line for a free link.*

Here's what you'll learn.

<p align="center">
  <img src="udemy-photo-laptop--lambda.png" style="max-width: 500px">
</p>


## Content

*Total learning material: 3h16. Subtitles: english.*

0. **Introduction video**

> Short list of features. Companies using Common Lisp. Why this course.

> Everything that was hard to find for me, is presented and explained to you.

1. **Section 1: Getting Started**

1.1. Install SBCL [🆓 free preview]

> What we see: install the SBCL implementation (on a Debian system), start it, write "hello world", understand the output, add readline support to the SBCL default REPL in the terminal, disable the interactive debugger, a few words on Lisp implementations and GNU CLISP in particular.

1.2. Run Lisp code from your terminal, write code with a simple text editor

> What we see: we write a code snippet with a simple text editor and we run it with sbcl's --script and --load flags. We use the LOAD function to reload & recompile our file while we are still in the Lisp image.

1.3. Portacle: a portable, multiplatform, ready-to-use Common Lisp IDE

> Portacle allows to get started with a Common Lisp editor in 3 clicks, on Windows, MacOS and Linux. It provides: Emacs, SBCL, Quicklisp (the package manager), SLIME (the Superior Lisp Integration Mode for Emacs) as well as SLY, Git and Magit (the famous Emacs package). If you already know Emacs: you can stop watching at 9'. We first see: what is Portacle and where to get it, what it provides, some custom integrations (M-x create-project, the tree project explorer, company-mode and paredit-mode). Then, we continue with a more in-depth exploration, so you can find your way inside Emacs (buffer management, file management, Lisp code evaluation, how to create and quickload a project, Magit, how to use the help system…).

2. **Lisp Basics**

2.1. Lisp syntax and evaluation model [🆓 free preview]

*I got a whole brand new microphone for that one, sound is great!*

> What we see: the prefix notation. Everything is an expression. The evaluation model: no surprises with functions, but macros don't follow this model. Code is data is code.

2.2. Variables

> How to define variables, at the toplevel or locally. What we see: defparameter, defvar, let, let*, setf, how to lexically re-bind dynamic variables, the gotcha, the alternative (pure functions).

2.3 Conditionals

> What we see: if, when, unless, cond, case, the or shortcut, the #+(or) "\*features\*" trick, an example where we load a lispy configuration file.


3. **Iteration**

3.1 Iterating over lists and vectors [🆓 free preview]

> What we see: LOOP in/across and its various accumulating clauses, dolist, for:for, coerce. 

3.2 Iterating over a hash-table keys and values

> What we see: 5 ways in 5 minutes to iterate over a hash-table. (NOTE: you don't imagine all the time that it took me to learn and discover these!!)

3.3 Iterating a fixed or infinite number of times

> What we see: dotimes, the same with loop, looping forever and building our first Lisp REPL.

3.4. Loop: high level overview and gotchas

> What we see: the structure of LOOP. Two rules to keep in mind. LOOP smells. We enhance an example from an answer of Advent Of Code 2021.


4. **All about functions**

4.1. How to create named functions, how to handle all types of arguments [🆓 free preview]

> What we see: defun, returned values, required arguments, optional arguments, key arguments, how to set a default value, how to know if an argument was supplied, &rest, example of apply, example of an inline assertion under a feature flag.

4.2. Referencing functions, redefining functions locally, accessing documentation

> What we see: apropos, documentation #'hello, the difference between 'hello and #'hello (quote, sharpsign-quote), flet and labels.

4.3. Multiple Return Values

> Multiple return values are NOT like returning a list or a tuple!!! What we see: counter-example in Python, values, multiple-value-bind, nth-value, values-list, m-v-l.

4.4. Higher Order Functions

> What we see: how to give functions as arguments, member, the :test keyword, map and mapcar, lambda, how to generate functions, setf symbol-function. A word on currying and being a Lisp-2.

4.5. Closures

> What we see: closures (let over lambda and lambda over let over lambda). Notions of lexical scope, functions and their environment.

4.6. setf functions

> What we see: how and why setf functions, with our previous counter example and a circle class (we set a new radius given a circumference).

4.7. Generic Functions (quick intro, sneak peak to CLOS)

> How to write functions that dynamically dispatch on the type of their arguments. What we see (quickly): defmethod, defgeneric (optional).

5. **Working with projects**

5.1 How to work with an existing project

> What we see: how to load the project thanks to its .asd file, install dependencies, go "in the package", being in a bare bones Lisp REPL or in Emacs and Slime. Appropriate Slime shortcuts. Get a list of the project's dependencies with ASDF programmatically.

5.2. How to create a new project

> What we see: a simple .asd file (flat source tree or a src/ subdirectory), a package definition, two project skeletons.

As a complement, see this video: [cl-cookieproject demo](https://www.youtube.com/watch?v=XFc513MJjos).

5.3. What are systems and packages anyways?

> What we see: a recap on systems. The :cl-user and :cl packages. Creating a package without using :cl symbols. Recovering from symbols name conflicts. Understanding that the reader "interns" symbols from what we type. Printing and counting external symbols of a package. Role of in-package. Exporting symbols.


## Who is this course for

This course is *not* for total newcomers in programming. You should know what variables and functions are.

Lisp newbies are welcome. I introduce Lisp basics (syntax, evaluation model…) to bootstrap you, but it's best if you know what is a language of the Lisp family.

This course is for young(ish) profesional developers like me, who feel they deserve a more fun, comfy, compiled and fast programming language.

It is for Python or JavaScript programmers frustrated by the unstability of their ecosystem,

for students of computer science who want to discover why Lisp still has un-matched alien technology inside,

for Clojurists who want to transition quickly to a bare-metal Lisp,

or simply for your friend or colleague.

## How to best use this course if you are already a programmer

If you are a proficient programmer and you want to go to the essentials:

- you can watch the videos at a higher speed: 1.25 or 1.50x
- try the captions, they're good
- you can start by the chapter of your choice. Inside a chapter though, we build on previous content (especially in the one about functions)
- you can leverage the fact that I go with a "code first" approach: show the code damn it, and then explain. So if the code is self-explanatory for you, you can skip the explanations.
- be sure to have a Lisp editor at hand, the HyperSpec and/or a book reference (CLtL2), the Cookbook and a project idea.
  - have a look at our exercise ideas
- be demanding but don't be in a rush.

## Exercises

See the `exercises/` directory. Here are ideas that you are able to do at the end of each chapter.

After chapter 5, you can fetch the GitHub API and build a project around that.

*(Udemy doesn't fit well to these ideas and to Lisp code)*


## TODOs

More content:

- [X] iteration
- [X] systems and packages
- working with SLIME
- Atom and SLIMA
- condition system
- CLOS
- concurrency

And also:

- creating CLI apps
- web applications
- …

In parallel, I want to **create shorter videos on other topics**. I'll see if interest is here… and time… and revenue (creating videos takes soooooo much time). See:

- [How to create a Common Lisp project with my project generator](https://www.youtube.com/watch?v=XFc513MJjos&feature=youtu.be)
- [Interactively fixing failing tests in Common Lisp](https://www.youtube.com/watch?v=KsHxgP3SRTs)


## Issues

- sound: I got a new microphone for my last video, "Lisp syntax and evaluation model". The sound of the other videos isn't good enough. Fix it.

## Feedback

I would like very much to have your feedback on the course, alongside your background in programming in a few words.

If you want to correct my (cute) accent, be my guest!

## Conclusion

Learn CL *now* and use it *all your life*: code written 30 years ago still runs today O_o

And have fun! Lisp is amazing.


[^1]: For "glue" scripts as well as for web apps, used by real clients. Here the buzzwords: SOAP and FTP, XML parsing, DB handling, web scraping, Sentry reporting (empty dashboard!), email with Sendgrid, simple books catalogue web app…

[^2]: I don't earn millions so your support through Udemy helps me and helps consolidate the CL ecosystem. Thank you!
