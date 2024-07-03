
(defpackage :clos-demo
  (:use :cl)
  (:documentation "Demo of the Common Lisp Object System.
   I go fast, more explanations in the dedicated videos.")
  (:export #:person  ;; <-- with Slime shortcut
           #:name
           #:age))

(in-package :clos-demo)


(defparameter *person1* nil)

(defclass person ()
  ((name :initform nil
         :accessor name
         :initarg :name
         :documentation "The person name ;)")
   (age :initform 0
        :initarg :age
        :accessor age)))


(defmethod print-object ((p person) stream)
  (print-unreadable-object (p stream :type t :identity t)
    (format stream "yeah! My person is ~a"
            (slot-value p 'name))))


(defmethod greet (anything)
  (format t "Hello you… you are of type ~a" (type-of anything)))

(defmethod greet ((ht hash-table))
  (declare (ignore ht))
  (format t "hey HT how are you?"))

(defmethod greet ((obj person))
  (format t "Hello ~a!" (name obj)))

(defclass planet ()
  ((name :initform "Earth"
         :initarg :name
         :accessor name)))

;; Usage:
;;
;; (name *person1*)
;;
;; (name *earth*)

;;
;; Inheritance
;;

(defclass child (person)
  ((favourite-game :initform "")))

(defmethod greet ((c child))
  (format t "you're so cute!"))

;;
;; multimethods
;;

(defmethod travel ((p person) (planet planet))
  (format t "wooooo!"))

(defmethod travel ((c child) (planet planet))
  (format t "are your parents ok?!~&")
  42)

;;
;; standard method combination
;; before, after, around qualifiers
;;

(defmethod travel :before ((c child) (planet planet))
  (format t "[before] gathering luggage…~&"))

(defmethod travel :around ((c child) (planet planet))
  (format t "[around] entering around…~&")
  (if (< (age c) 12)
      (error "child is too young!")
      (call-next-method)))

(defmethod travel :after ((c child) (planet planet))
  (format t "[after] taking pictures.~&"))


;; ! order of execution !

#|

CL-USER> (travel *child1* *earth*)

=>

[around] entering around…      if call-next-method then:
[before] gathering luggage…
are your parents ok?!
[after] taking pictures.
42

|#
