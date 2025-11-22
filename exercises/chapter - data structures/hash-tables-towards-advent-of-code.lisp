
;;;
;;; Follow the instructions.
;;; These were inspired by an Advent Of Code puzzle.
;;; We are only warming up.
;;;

;; Do this with only CL built-ins,
;; or with the dict notation,
;; or with something else,
;; or all three one after the other.

;; We will build up a grid stored in a hash-table to represent a map like this:
#| "....#...##....#"

where the # character represents an obstacle.

In our case the grid is in 1D, it is often rather 2D.
|#

;; This grid/map is the base of many AOC puzzles.
;;
;; Take a second: shall we represent a 2D grid as a list of lists, or something else,
;; (it depends on the input size)
;; and how would you do in both cases?


;;
;; 1. Define a function MAKE-GRID that returns an empty grid (hash-table).
;;
(defun make-grid ()
  ;; todo
  )
;;
;; Define a top-level parameter to represent a grid that defaults to an empty grid.
;;

;; def… *grid* …

;;
;; 2. Create a function named CELL that returns a hash-table with those keys:
;; :char -> holds the character of the grid at this coordinate.
;; :visited or :visited-p or even :visited? -> stores a boolean,
;;  to tell us if this cell was already visited (by a person walking in the map). It defaults
;;  to NIL, we don't use this yet.
;;

(defun cell (char &key visited)
  ;; todo
  )

;;
;; 3. Write a function to tell us if a cell is an obstacle,
;;    denoted by the #\# character
;;
(defun is-block (cell)
  "This cell is a block, an obstacle. Return: boolean."
  ;; todo
  ;; get the :char key,
  ;; check it equals the #\# char.
  ;; Accept a cell as NIL.
  )

;;
;; 4. Fill the grid (with devel data).
;;
;; Iterate on a given string (the puzzle input),
;; create the grid,
;; keep track of the X coordinate,
;; for each character in the input create a cell,
;; associate the coordinate to this cell in the grid.
;;

(defparameter *input* ".....#..#.##...#........##...")

(defun parse-grid (input)
  "Parse a string of input, fill a new grid with a coordinate number -> a cell (hash-table).
  Return: our new grid."
  (loop :for char :across input
        :with grid := (make-grid)
        :for x :from 0
        :for cell := (cell char)
        :do
           ;; associate our grid at the X coordinate
           ;; with our new cell.
           ;; (setf … )
        :finally (return grid)))

;; try it:
#++
(parse-grid *input*)

;;;
;;; That's only a simple example of the map mechanism that comes regurlarly in AOC.
;;; You might stumble across a more difficult exercise later in the course ;)
;;;
