
;;;
;;; This exercise comes from Advent Of Code 2024, day 01.
;;; https://adventofcode.com/2024/day/1
;;;
;;; Read the puzzle there!
;;; Try with your own input data!
;;;
;;; Here are the shortened instructions.

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

;;; This is your puzzle input:
;;; a string representing two colums of integers.

(defparameter *input* "3   4
4   3
2   5
1   3
3   9
3   3")

;;; We'll need to parse this string into two lists of integers.
;;;
;;; This isn't part of the chapter's goals on data structures,
;;; so here's a function to do that.
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;; [hiding in case you want to do it…]
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;
;;;

(defun split-lines (s)
  "Split the string S by newlines.
  Return: a list of strings."
  ;; If you already quickloaded the STR library, see:
  ;; (str:lines s)
  ;;
  ;; UIOP comes with ASDF which comes with your implementation.
  ;; https://asdf.common-lisp.dev/uiop.html
  ;;
  ;; #\ is a built-in reader-macro to write a character by name.
  (uiop:split-string s :separator '(#\Newline)))

#+lets-try-it-out
;; This is a feature-flag that looks into this keyword in the top-level *features* list.
;; The expression below should be highlihgted in grey
;; because :lets-try-it-out doesn't exist in your *features* list.
;;
;; You can compile this with C-c C-c
;; Nothing should happen.
(assert (equal '("3   4" "4   3" "2   5" "1   3" "3   9" "3   3")
               (split-lines *input*)))
;;                                   ^^ you can put the cursor here and eval the expression with C-x C-e, or send it to the REPL with C-c C-j.


;; A utility function.
;; We could inline it.
;; But, measure before trying any speed improvement.
(defun blank-string (s)
  "S is a blank string (no content)."
  (equal "" s))

#+(or)
(blank-string nil)
#++
(blank-string 42)
#+(or)
(blank-string "")

(defun split-words (s)
  "Split the string S by spaces and only return non-blank results.

  Example:

    (split-words \"3    4\")
    => (\"3\" \"4\")
  "
  ;; If you quickloaded the STR library, see:
  ;; (str:words s)
  ;; which actually uses cl-ppcre under the hood to split by the \\s+ regexp,
  ;; and ignore consecutive whitespaces like this.
  ;;
  (let ((strings (uiop:split-string s :separator '(#\Space))))
    (remove-if #'blank-string strings)))

#+lets-try-it-out
;; test this however you like.
(split-words "3       4")


(defun parse-input (input)
  "Parse the multi-line INPUT into a list of two lists of integers."
  ;; loop! I like loop.
  ;; We see everything about loop in the iteration chapter.
  ;;
  ;; Here, we see one way to iterate over lists:
  ;; loop for … in …
  ;;
  ;; Oh, you can rewrite it in a more functional style if you want.
  (loop :for line :in (split-lines input)
        :for words := (split-words line)
        :collect (parse-integer (first words)) :into col1
        :collect (parse-integer (second words)) :into col2
        :finally (return (list col1 col2))))

#+lets-try-it-out
(parse-input *input*)
;; ((3 4 2 1 3 3) (4 3 5 3 9 3))

;;;
;;;
;;; TODO:
;;;
;;; The exercise continues.
;;;
;;; Maybe the lists are only off by a small amount! To find
;;; out, pair up the numbers and measure how far apart they are. Pair
;;; up the smallest number in the left list with the smallest number
;;; in the right list, then the second-smallest left number with the
;;; second-smallest right number, and so on.
;;;
;;; => we need to SORT the columns by ascending order.;;;
;;;
;;; Within each pair, figure out how far apart the two numbers are;
;;;
;;; => we need to compute their relative, absolute distance.
;;;
;;; you'll need to add up all of those distances.
;;;
;;; => we need to sum each relative distance.
;;;
;;; For example, if you pair up a 3 from the left list with a 7 from
;;; the right list, the distance apart is 4; if you pair up a 9 with a
;;; 3, the distance apart is 6.
;;;
;;; Our input data's sum of the distances is 11.


;;;
;;;
(defun sort-columns (list-of-lists)
  "Accept a list of two lists.
  Sort each list in ascending order.
  Return a list of two lists, each sorted."
  (error "not implemented"))

;; Use this to check your SORT-COLUMNS function.
;; You can write this in a proper test function if you want.
#+lets-try-it-out
(assert (equal (sort-columns (parse-input *input*))
               '((1 2 3 3 3 4) (3 3 3 4 5 9))))

;;;
;;; Compute the absolute distance.
;;;

;; utility function.
(defun distance (a b)
  "The distance between a and b.
  Doesn't matter if a < b or b < a."
  ;;
  ;; hint: (abs -1) is 1
  ;;
  (error "not implemented")
  )

(defun distances (list-of-lists)
  "From a list of two lists, compute the absolute distance between each point.
  Return a list of integers."
  (error "not implemented")
  ;; hint:
  ;; (mapcar #'TODO (first list-of-lists) (second list-of-lists))
  ;;
  ;; mapcar is a functional-y way to iterate over lists.
  )


(defun sum-distances (list-of-integers)
  "Add the numbers in this list together."
  (error "not implemented")
  ;; Hint:
  ;; try apply, funcall, mapcar, reduce.
  ;; (TODO #'+ list-of-integers)
  ;; or loop … sum !
  )


;;;
;;; Verify.
;;;

(defun solve (&optional (input *input*))
  ;; let it flow:
  (sum-distances (distances (sort-columns (parse-input input)))))

#+lets-try-it-out
(assert (equal 11 (solve)))

;;;
;;; Now try with your own input data!
;;;

;;;
;;; Next:
;;; - do the same with the STR library.
;;; - write a top-level instructions that calls our "main" function so that you can call this file as a script from the command line, with sbcl --load AOC-2024-day01.lisp
;;;
