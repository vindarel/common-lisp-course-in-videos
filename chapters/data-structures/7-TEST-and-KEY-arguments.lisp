;;;
;;; Searching data structures with :test and :key
;;;
;;; From "data structures" chapter, video "working with compound data structures: :TEST and :KEY".
;;; https://www.udemy.com/course/common-lisp-programming/
;;;
;;; :test -> typically, when working with strings
;;; :key ->  for compound objects
;;;
;;;


;; What's going on here?

(find "hello" (list "foo" "hello"))
;; => NIL
;; What ?!

(find "hello" (list "foo" "hello") :test #'equal)
;;                                    or #'string=


;; sort this ?
;;
;; :key

(defparameter *list-of-lists* '(  (1 9)   (3 7)   (2 8)  ))

(sort (copy-seq *list-of-lists*) #'< :key #'second)



;;;
;;; Sequence functions with compound objects
;;;

(defparameter *list-of-points*
  (list (list :x 1 :y 2)  ;; plist -> access element with getf
        (list :x 10 :y 20)))

;; find objects whose coordinate :x is 10
(find 10 *list-of-plists* :key (lambda (plist)
                                 (getf plist :x)))

;; same, written with an accessor function:

(defun coord-x (plist)
  (getf plist :x))

(find 10 *list-of-plists* :key #'coord-x)


;; Using a struct:

(defstruct point ;; CLOS is better ;)
  x y)
;; make-point = constructor
;; point-x  = accessor
;; point-y

(defparameter *list-of-structs*
  (list (make-point :x 1 :y 2)
        (make-point :x 10 :y 20)))

(find 10 *list-of-structs* :key #'point-x)


;; Combining :key and :test

(defstruct point
  x y name)

(defparameter *list-of-compound-objects*
  (list (make-point :x 1 :y 2 :name "point1")
        (make-point :x 10 :y 20 :name "point2")))

(find "point2" *list-of-compound-objects*
      :key #'point-name
      :test #'string=
      )


;; function reference on
;; https://lispcookbook.github.io/cl-cookbook/data-structures.html#sequences
