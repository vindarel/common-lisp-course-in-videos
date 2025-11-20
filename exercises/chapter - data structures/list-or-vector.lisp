
;;;
;;; Create a list and an array by a fixed size,
;;; access by index.
;;;

(defparameter *size* (* 10 1000))
;; (defparameter *size* (* 100 1000))

(defun read-database-rows-as-list ()
  "Simulate reading a database and getting results as a big list."
  (make-list *size* :initial-element 1))

(defun read-database-rows-as-array ()
   (make-array *size* :initial-element 1))

(defun dummy-benchmark ()
  "hand-made benchmarks have a great chance to being useless and not measure anything,
  because Lisp compilers (especially SBCL) are very good at optimizing code graphs.

  Below, we iterate over a list and across a vector to access an element by its index,
  we use this value to do something (the ASSERT), and we observe a difference
  in execution time.

  We don't measure the implementation's speed, we compare the relative
  access time by index of two different data structures."
  (let ((list (read-database-rows-as-list))
        (vector (read-database-rows-as-array)))
    (time
     (dotimes (i *size*)
       (assert (equal 1 (elt list i)))))
    (time
     (dotimes (i *size*)
       (assert (equal 1 (aref vector i)))))))

(dummy-benchmark)

;;;
;;; Note the differences in execution time.
;;;
;;; Did these loop create objects in memory? (did they "cons"?) The TIME result tells us.
;;;
