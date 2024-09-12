;;
;; CLOS - class allocation
;;
(defpackage :clos-demo
  (:use :cl))
(in-package :clos-demo)


(defclass person ()
  ((name :initarg :name
         :initform nil
         ;; :allocation :instance   ;; <------- default allocation
         ;;                                     = unique value for every and each object
         :accessor name)
   (counter :initform 0
            :allocation :class   ;; <------------ class allocation
            ;;                                    = shared between all Person objects.
            :accessor counter
            :documentation "Count all persons ever created. Done with an :after method on initialize-instance.")
   (species :initform :mortal
            :allocation :class)))



(defparameter p1 (make-instance 'person))
(defparameter p2 (make-instance 'person))

(defmethod print-object ((p person) stream)
  (print-unreadable-object (p stream :type t :identity t)
    (format stream "species: ~a, objects counter: ~a, name: ~a"
            (slot-value p 'species)
            (slot-value p 'counter)
            (if (slot-boundp p 'name)
                (slot-value p 'name)
                "unbound")
            )))


(defmethod initialize-instance :after ((p person)
                                       &rest args
                                       &key &allow-other-keys)
  (declare (ignorable args))
  (incf (counter p)))
