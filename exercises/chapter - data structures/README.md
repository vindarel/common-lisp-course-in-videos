
```
;;;
;;; Practice with the code snippets below.
;;; Run them, tweak them.
;;; Run them from the terminal, or explore your editor.
;;;
;;; Those are the snippets from the video, and a few more.
;;;
```


# DATA STRUCTURES: exercises

We ship code snippets from the video, extended,


## PRACTICE: list creation

Practice proper list, plist and alist creation.

```
list make-list fill quote getf remf, assoc, alexandria's assoc-value & rassoc-value
```

## PRACTICE: access elements in sequences

```
first… tenth, car, cdr, butlast, nthcdr, push, pop, pushnew, list* [and more]
```

## PRACTICE: sequence manipulation functions

Get to know all built-in sequence manipulation functions.

## PRACTICE: equality, working with strings gotchas

Snippets from the video, and more.

## EXERCISE: AOC 2024 day 01


```
;;; ********************************************************************
;;; WARN: this exercise migth be hard if you don't know about functions.
;;; ********************************************************************
;;;
;;; you can come back to it later.
;;; But, you can have a look, explore and get something out of it.
;;;

;;; In this exercise, we use:
;;; SORT
;;; ABS
;;; FIRST, SECOND
;;; EQUAL
;;; LOOP, MAPCAR, REDUCE to iterate and act on lists.
;;; REMOVE-IF
;;; PARSE-INTEGER
;;; UIOP (built-in) and a couple string-related functions
;;;
;;; and also:
;;; feature flags
;;; ERROR
;;;
;;; we don't rely on https://github.com/vindarel/cl-str/
;;; (nor on cl-ppcre https://common-lisp-libraries.readthedocs.io/cl-ppcre/)
;;; but it would make our life easier.
;;;
```

## EXERCISE: compare lists and vectors

A dummy benchmark to witness the difference in access time by index between a list and a vector.

[list-or-vector.lisp](list-or-vector.lisp)

## PRACTICE: hash-tables manipulation and fixing their ergonomic flaws

```
;;; Snippets of the video: "Hash-tables (dicts) and fixing their ergonomic flaws"
;;; (which is free to watch for everyone)
;;;

;;;
;;; We see:
;;;
;;; MAKE-HASH-TABLE
;;; GETHASH
;;; (SETF (GETHASH …) …)
;;; ALEXANDRIA:HASH-TABLE-KEYS
;;; SERAPEUM:DICT
;;; MAPHASH
;;; DEFPACKAGE
;;; WITH-OPEN-FILE
;;; UIOP:READ-FILE-FORM
;;;
```
