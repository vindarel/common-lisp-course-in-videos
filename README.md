🕊

<p>
  <h2 align="center"> Common Lisp Programming Course </h2>
  <h3 align="center"> Learn Lisp effectively, in videos </h3>
</p>

<p align="center">
  <a href="https://www.udemy.com/course/common-lisp-programming/?referralCode=2F3D698BBC4326F94358"><b> The course </b></a> |
  <a href="https://lisp-journey.gitlab.io/"><b> Blog </b></a> |
  <a href="https://framapiaf.org/@vindarel"><b> Mastodon </b></a> |
  <a href="https://twitter.com/vindarel"><b> Twitter </b></a>

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

*Here's a [60% coupon until March 18th, 2023](https://www.udemy.com/course/common-lisp-programming/?couponCode=GITHUBPOWER2023).* *If you are a student, drop me a line for a free link.*

Here's what you'll learn.

<p align="center">
  <img src="udemy-photo-laptop--lambda.png" style="max-width: 500px">
</p>


## Content

*Total learning material: 4h06 and counting. Subtitles: english.*

0. **Introduction video**

> Short list of features. Companies using Common Lisp. Why this course.

> Everything that was hard to find for me is presented and explained to you.

1. **Section 1: Getting Started**

1.1. Install SBCL [🆓 free preview]

> What we see: install the SBCL implementation (on a Debian system), start it, write "hello world", understand the output, add readline support to the SBCL default REPL in the terminal, disable the interactive debugger, a few words on Lisp implementations and GNU CLISP in particular.

1.2. Run Lisp code from your terminal, write code with a simple text editor

> What we see: we write a code snippet with a simple text editor and we run it with sbcl's --script and --load flags. We use the LOAD function to reload & recompile our file while we are still in the Lisp image.

1.3. 🚀 BONUS - Scripting with batteries included [NEW as of April, 2023]

> I demo what may be the simplest method to run some Lisp code as of today. We use a simple to install a binary that allows to run lisp files as scripts, with many third-party libraries already baked-in. We request an HTTP endpoint and we parse it in JSON, without resorting to Quicklisp, and our script starts fast: we don't wait for the libraries to load. I show built-in scripts: a simple HTTP server to serve a local directory, a simple web app with routes, how to watch and auto-reload files.

> This is a new tool still in development, so I'll call it a bonus and not an official, standard way. Hope you find it useful though. I sure do.

1.4. Portacle: a portable, multiplatform, ready-to-use Common Lisp IDE

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

6. **The Condition Handling System** [🆕 as of Oct. 2022]

6.1 How to create an error, a warning and a simple-condition [🆓 free preview]

> What we see: the ERROR and WARNING functions, MAKE-CONDITION and SIGNAL. What are simple conditions good for?

6.2 How to handle ("catch") all sorts of errors and conditions

> What we see: HANDLER-CASE, how to use it with built-in conditions types (division-by-zero…) and with conditions from third-party libraries. The importance of the class precedence list. How to inspect our Lisp image to find available error types.

6.3 How to define our own errors

> What we see: DEFINE-CONDITION, :report, :initargs, :initform, :reader and :accessor. Example of a locked package. How to print our error message to the end user.

6.4 IGNORE-ERRORS

> A quick demo of a very useful macro, coupled with a pattern I use a lot. How to build this macro with HANDLER-CASE.

6.6 UNWIND-PROTECT: the "finally" in try/catch/finally

6.7 HANDLER-BIND: the lispy super-power (NEW on Feb 13th, 2023)

> What we see: what is a call stack, how HANDLER-CASE unwinds it, what HANDLER-BIND does better, its syntax, a practical example. A word about restarts and the INVOKE-DEBUGGER trick for development.

<!-- 6.8 (upcoming) Restarts -->

See exercises in `chapter 6 - condition handling/`.


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

*(The Udemy exercices section doesn't fit well to these ideas and to Lisp code)*


## TODOs

More content:

- [X] getting started
- [X] Lisp basics
- [X] all about functions
- [X] iteration
- [X] systems and packages
- [X] the condition system (**NEW** Oct, 2022, expanded in February, 2023)
- CLOS (see the Cookbook for now)
- macros
- IDEs:
  - working with SLIME
  - ~~Atom~~ Pulsar and SLIMA
- concurrency

And also:

- creating CLI apps
- web applications
- …

## Demos on Youtube

In parallel, I want to **create shorter videos on other topics**. I'll see if interest is here… and time… and revenue (creating videos takes soooooo much time). See:

- [How to call a REST API in Common Lisp: fetching the GitHub API](https://www.youtube.com/watch?v=TAtwcBh1QLg) We see HTTP requests with Dexador, handling JSON… in the end we also build an utility for the command line.
- [How to create a Common Lisp project with my project generator](https://www.youtube.com/watch?v=XFc513MJjos&feature=youtu.be)
- [Interactively fixing failing tests in Common Lisp](https://www.youtube.com/watch?v=KsHxgP3SRTs)
- [Debugging Common Lisp: fix and resume a program from any point in the stack](https://www.youtube.com/watch?v=jBBS4FeY7XM) - with Emacs and the Lem editor. We show how to fix a bug, re-compile ONE function and resume execution from where it failed. An extremely useful lesser known Common Lisp feature. We do all that while the program is still running and we avoid re-running long computations.


## Issues

- sound: my first videos have a meh sound. I quickly bought a new microphone (January, 2022) for the following ones, starting with "Lisp syntax and evaluation model". Now, the majority of the chapters have a good sound. I re-recorded 1 video already and I'll eventually fix the rest.

## Feedback

I would like very much to have your feedback on the course, alongside your background in programming in a few words.

If you want to correct my (cute) accent, be my guest!

Here is some feedback from people who took the course:

> Thank you so much! I love the Udemy course and am always excited when new chapters arrive 😀

@louis@emacs.sh on Mastodon, on February of 2023 (much thanks too!).

> To start with, thanks to the author to create a course like this so that new Lispers (to Common Lisp at least) can learn something new. I've been working with (or managing to at least) Emacs Lisp for about a decade but wanted to get a little closer to Lisp, which brings me here. I took this course as a supplement to the book amazing book Land of Lisp in order to get more "practical" insights into Common Lisp, and how it's been used by "real" lispers. Vincent does a great job talking about the concepts and often also alerts the audience of a few gotchas here and there. He also does a decent job at explaining a few concepts that may be alien to most people who aren't really familiar with Lisp concepts. Having said that, I felt that there were still plenty of concepts that could be covered a little closer and some of which I could only understand due to my familiarity with Lisp due to my reading from Land of Lisp. Finally, I'll keep an eye on future additions to the course!

Mohammed, on June of 2022. Rated the course 5/5.

> I am really enjoying this course and I think that Cookbook you assembled is fantastic.

Chris, February of 2022.


> Very good content. Common Lisp is amazing.

Vivian, October of 2022.


> Thanks for the course on CL. I enjoyed most of time, particularly the videos with a new mic. However, some videos are hard to understand due to the microphone and English pronunciation. I was mostly able to follow, but sometimes concepts and language features were used without prior introduction or an appropriate explanation at the time of using it. Definitely recommend to use further introductory books on CL. Some topics are missing e.g. in-depth classes and macros. I still do not understand what a symbol is actually ^-^

Tom, September of 2022, rated 3/5 (valuable information, accurate course description, engaging delivery, knowledgeable instructor, but lacking helpful practice activities and not so clear explanations). He is right that some topics are currently missing. I am still working on new content.

> I get distracted because of his french accent.

Dietmar, October of 2022. Doing my best and started to practice with a friend :S (one note: there are subtitles to help).

> Very thorough! And the lisp cookbook online was a great supplement/introduction to the concepts in this course :)

Sam, on July of 2022. Rated 5/5.

> [french] J'en suis à la moitié. La pédagogie est au rendez-vous et c'est vraiment cool! Ça donne envie d'aller plus loin. Merci pour ce travail.

("I did half of the course. Pedagogy is there as expected and it's really cool! Thus one wants to see more. Thanks for this work.")

fredg, on Mastodon, December 2022.


## Conclusion

Learn CL *now* and use it *all your life*: code written 30 years ago still runs today O_o

And have fun! Lisp is amazing.


[^1]: For "glue" scripts as well as for web apps, used by real clients. Here the buzzwords: SOAP and FTP, XML parsing, DB handling, web scraping, Sentry reporting (empty dashboard!), email with Sendgrid, simple books catalogue web app…

[^2]: I don't earn millions so your support through Udemy helps me and helps consolidate the CL ecosystem. Thank you!
