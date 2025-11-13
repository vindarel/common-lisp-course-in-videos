
;;;
;;; solutions
;;;


(defun sort-columns (list)
  (list
   (sort (first list) #'<)
   (sort (second list) #'<)))


(abs (- a b))


(mapcar #'distance (first list-of-lists) (second list-of-lists))


(reduce #'+ list-of-integers)
;; or
(loop for x in list-of-integers
      sum x)
