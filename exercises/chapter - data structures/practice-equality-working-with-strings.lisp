
;;;
;;; Practice equality functions.
;;; See the lecture: "Equality - working with strings gotchas".
;;;
;;; Run all the snippets and observe the results.
;;; Some might return NIL or signal an error, to your surprise if you are unaware
;;; of the various equality functions.
;;;

;; List of not only strings:
(defparameter *list* (list 0 :one "two" (make-hash-table) 'three))

;; base case:
(count 0 *list*)
;; => 1

;; Now with strings:
(count "two" *list*)
(count "two" *list* :test #'eq)
(count "two" *list* :test #'eql)
(count "two" *list* :test #'equal)
(count "two" *list* :test #'equalp)
(count "two" *list* :test #'string=)
(count "two" *list* :test #'string-equal)

(defparameter *list-of-strings* (list "hello" "you" "you" "lisper"))

(count "you" *list-of-strings*)
(count "you" *list-of-strings* :test #'eql)
(count "you" *list-of-strings* :test #'equal)
(count "you" *list-of-strings* :test #'string=)
(count "you" *list-of-strings* :test #'string-equal)

;; Count keywords:
(count :one *list*)
(count :one *list* :test #'eql)
(count :one *list* :test #'eq)

;; Compare numbers:
(= 2 2)
(= 2.0 2)
(= 2.0 nil)
(equal 2.0 nil)
(eql 2.0 2)


;;;
;;; Now you can try, if that's your cup of tea:
;;; https://github.com/alex-gutev/generic-cl/
;;; (ql:quickload "generic-cl")
;;; CL-USER> (generic-cl:= 2 2.0)
;;; CL-USER> (generic-cl:= 2 nil)
;;; (and much more)
;;;
;;; and/or
;;;
;;; https://github.com/karlosz/equals/
;;; (ql:quickload "equals")
;;;
;;; CL-USER> (equals:equals 2 2.0)
;;; CL-USER> (equals:equals 2 nil)
;;; (and a bit more)
;;;
