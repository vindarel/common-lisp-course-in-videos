
(in-package :cl-user)
(defpackage :mytestpackage
  (:use :cl)
  (:import :ppcre
           :scan)
  (:export :*fisrt-symbol*))

(in-package :mytestpackage)

(defparameter *fisrt-symbol* 'hello)
