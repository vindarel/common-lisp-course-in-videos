
(defpackage :mytestpackage
  (:use :cl)
  (:import-from :ppcre  ;; import one symbol from this library
   :parse-string)
  (:export :*fisrt-symbol*))

(in-package :mytestpackage)

(defparameter *fisrt-symbol* 'hello)
