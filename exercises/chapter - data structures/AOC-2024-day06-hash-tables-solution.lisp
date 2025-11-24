
;;;
;;; This exercise comes from Advent Of Code 2024, day 06.
;;; https://adventofcode.com/2024/day/6
;;; It's an opportunity to use hash-tables.
;;;
;;; Read the puzzle there!
;;; Try with your own input data!
;;;
;;; Here are the shortened instructions.

;;;
;;; ********************************************************************
;;; WARN: this exercise migth be hard if you don't know about functions.
;;; ********************************************************************
;;;
;;; you can come back to it later.
;;; But, you can have a look, explore and get something out of it.

;;;
;;; In this exercise, we use:
;;;
;;; parameters
;;; functions
;;; recursivity
;;; &aux in a lambda list
;;; CASE
;;; return-from
;;; &key arguments
;;; complex numbers
;;; hash-tables
;;; the DICT notation (though optional)
;;; LOOPing on a list and on strings
;;; equality for characters



;; We use the DICT notation.
(import 'serapeum:dict)

;; Please, quickload the STR library for this puzzle.
#++
(ql:quickload "str")
;; Otherwise, see this as another exercise to rewrite the functions we use.

;;; This is your puzzle input:
;;; a string representing a grid, a map.
(defparameter *input* "....#.....
.........#
..........
..#.......
.......#..
..........
.#..^.....
........#.
#.........
......#...")

;; the # represents an obstacle,
;; the ^ represents a guard that walks to the top of the grid.
;;
;; When the guard encounters an obstacle, it turns 90 degrees right, and keeps walking.
;;
;; Our task is to count the number of distinct positions the guard will visit on the grid
;; before eventually leaving the areo

;; We will have to:
;; - parse the grid into a data structure
;;   - preferably, an efficient data structures to hold coordinates. Indeed, AOC *real* inputs are large.
;; - for each cell, note if it's an obstacle, if that's where the guard is, if the cell was already visited,
;; - count the number of visited cells.


;; We'll represent a cell "object" by a hash-table.
;; With Serapeum's dict:
(defun cell (char &key guard visited)
  (dict :char char
        :guard guard
        :visited visited))

;; Our grid is a dict too.
;; We create a top-level variable, mainly for devel purposes.
(defvar *grid* (dict)
  "A hash-table to represent our grid. Associates a coordinate (complex number which represents the X and Y axis in the same number) to a cell (another hash-table).")
;; You could use a DEFPARAMETER, like I did initially. But then, a C-c C-k (recompile current file) will erase its current value, and you might want or not want this.

;; For each coordinate, we associate a cell.
;;
;; What is a coordinate? We use a trick we saw in other people's AOC solution,
;; to use a complex number.
;; Indeed, with its real and imaginary parts, it can represent both the X axis and the Y axis
;; *at the same time in the same number*.

#|
;; Practice complex numbers:

(complex 1)
;; => 1
(complex 1 1)
;; => represented #C(1 1)

;; Get the imaginary part (let's say, the Y axis):
(imagpart #C(1 1))

;; the real part (X axis):
(realpart #C(1 1))

|#

;; Look, we are tempted to go full object-oriented
;; and represent a "coordinate" object, a "cell" object and whatnot,
;; but it's OK we can solve the puzzle with usual data structures.

;; Let's remember where our guard is.
(defvar *guard* nil
  "The guard coordinate. Mainly for devel purposes (IIRC).")

;;;
;;; Task 1: parse the grid string.
;;;

;; We must parse the string to a hash-table of coordinates -> cells.
;;
;; I'll write the main loop for you
;; since you didn't see the Iteration chapter yet.

(defun parse-grid (input)
  "Parse INPUT (string) to a hash-table of coordinates -> cells."
  ;; We start by iterating on each line.
  (loop :for line :in (str:lines input)
        ;; start another variable that tracks our loop iteration.
        ;; It it incremented by 1 at each loop by default.
        :for y :from 0  ;; up and down, imagpart of our coordinate number.
        ;; The loop syntax with … = … creates a variable at the first iteration,
        ;; not at every iteration.
        :with grid = (dict)

        ;; Now iterate on each line's character.
        ;; A string is an array of characters,
        ;; so we use ACROSS to iterate on it. We use IN to iterate on lists.
        ;;
        ;; The Iterate library has the generic :in-sequence clause if that's your thing (with a speed penalty).
        :do (loop :for char :across line
                 :for x :from 0   ;; left to right, realpart of our coordinate.
                 :for key := (complex x y)
                  ;; Create a new cell at each character.
                  :for cell := (cell char)
                  ;; Is this cell the guard at the start position?
                 :when (equal char #\^)
                   :do (progn
                         ;; Here, use SETF on GETHASH
                         ;; to set the :guard keyword of the cell to True.
                         (setf (gethash :guard cell) t)

                         ;; For devel purposes, we will also keep track of
                         ;; where our guard is with a top-level parameter.
                         (setf *guard* key)
                         )
                  :do
                     ;; Normal case:
                     ;; use SETF on GETHAH
                     ;; to associate this KEY to this CELL in our GRID.
                     (setf (gethash key grid) cell)
                  )
        :finally (return grid))
  )

;; devel: test and bind a top-level param for ease of debugging/instropection/poking around.
#++
(setf *grid* (parse-grid *input*))


;;;
;;; Taks 2: walk our guard, record visited cells.
;;;

;; We have to move our guard on the grid, until it exits it.
;;
;; I'll give you a couple utility functions.

(defun is-block (cell)
  "Is this cell an obstacle?"
  ;; accept a NIL, we'll stop the walk in the next iteration.
  (when cell
    (equal (gethash :char cell) #\#)))

;; We choose the write the 4 possible directions as :up :down :right :left.
;; See also:
;; exhaustiveness checking at compile-time:
;; https://dev.to/vindarel/compile-time-exhaustiveness-checking-in-common-lisp-with-serapeum-5c5i

(defun next-x (position direction)
  "From a position (complex number) and a direction, compute the next X."
  (case direction
    (:up (realpart position))
    (:down (realpart position))
    (:right (1+ (realpart position)))
    (:left (1- (realpart position)))))

(defun next-y (position direction)
  "From a position (complex number) and a direction, compute the next Y."
  (case direction
    (:up (1- (imagpart position)))
    (:down (1+ (imagpart position)))
    (:right (imagpart position))
    (:left (imagpart position))))

;; This is the "big" function that moves the guard,
;; records were it went,
;; makes it rotate if it is against a block,
;; and iterates, until the guard goes out of the map.
(defun walk (&key (grid *grid*) (input *input*)
               (position *guard*)
               (cell (gethash *guard* *grid*))
               (direction :up)
               (count 0)
               ;; &aux notation: it saves a nested of LET bindings.
               ;; It's old style.
               ;; Those are not arguments to the function we pass around,
               ;; they are bindings inside the function body.
             &aux next-cell
               next-position
               obstacle-coming)
  "Recursively move the guard and annotate cells of our grid,
  count the number of visited cells."

  ;; At each iteration, we study a new cell we take on our grid.
  ;; If we move the guard to a coordinate that doesn't exist in our grid,
  ;; we stop here.
  (unless cell
    (return-from walk count))

  ;; Look in the same direction first and see what we have.
  (setf next-position
        (complex (next-x position direction) (next-y position direction)))

  (setf next-cell (gethash next-position grid))

  ;; obstacle?
  (setf obstacle-coming (is-block next-cell))

  ;; then change direction.
  (when obstacle-coming
    (setf direction
          (case direction
            (:up :right)
            (:down :left)
            (:right :down)
            (:left :up))))

  ;; (devel) we mark the cell as visited, is it really required for our task, counting?
  (unless (gethash :visited cell)
    (incf count)
    (setf (gethash :visited cell) t))

  ;; get our next position now.
  (setf next-position
        (complex (next-x position direction) (next-y position direction)))

  ;; This next cell may or may not be in our grid (NIL).
  (setf next-cell (gethash next-position grid))

  (walk :grid grid :input input
        :cell next-cell
        :position next-position
        :direction direction
        :count count))

(defun part-1 (input)
  (walk :grid (parse-grid input)))

#++
(part-1 *input*)
;; 41
;; The right answer for this input.
;; In AOC, you have a bigger, custom puzzle input. This can lead to surprises.
;;
;; Did you notice we still use top-level variables, such as *guard*? Try to eliminate them.
