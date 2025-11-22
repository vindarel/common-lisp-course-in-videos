


;; Define a function MAKE-GRID that returns an empty grid (hash-table).
(defun make-grid ()
  (dict))

(defparameter *grid* (make-grid)
  "Our grid, a hash-table that associates a X coordinate to a cell.")



(defun cell (char &key visited)
  (dict :char char
        :visited nil))

(defun is-block (cell)
  "This cell is a block, an obstacle. Return: boolean."
  (when cell
    (equal (gethash :char cell) #\#)))

(defun parse-grid (input)
  "Parse a string of input, fill a new grid with a coordinate number -> a cell (hash-table).
  Return: our new grid."
  (loop :for char :across input
        :with grid := (make-grid)
        :for x :from 0
        :for cell := (cell char)
        :do
           (setf (gethash x grid) cell)
        :finally (return grid)))
