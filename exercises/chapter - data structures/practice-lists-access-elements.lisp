

;;;
;;; List manipulation: access elements.
;;;
;;; snippets from the video, and a few more.
;;;

(defparameter *list* (list 0 :one "two" (make-hash-table) 'three))

;; first (car), second, third… tenth

(first *list*)

;; rest (cdr)
(rest *list*)

;; last, butlast
(last *list*)
(first (last *list*))

(alexandria:last-elt *list*)

(butlast *list*)

;; nth, nthcdr

(nth 2 *list*)

(nthcdr 2 *list*)

;;;
;;; Add elements to a list, set elements.
;;;

(defparameter *my-list* (list 0 1 2))

(push :that *my-list*)
(pop *my-list*)

(pushnew :thing *my-list*)

(list* :in :front  *my-list*)

(loop :for i :upto 9
      :collect i)

(loop for elt in (list :one "two" (list 3))
      do (format t "~&elt ~s is of type: ~a~&" elt (type-of elt)))

(setf (nth 1 *list*) :changed!)

(append (list 1 2 3) (list 10 20 30))

;; and… nconc, destructive.

;; for sequences:
(concatenate 'string (list "hello") (list "foo"))

#+(or)
(ql:quickload "str")

(str:concat "hello" " " "world")

(str:join " " (list "hello" "world"))

(str:unwords (list "hello" "world"))
