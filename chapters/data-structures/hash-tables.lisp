;;;
;;; Hash-table: key-value store.
;;;
;;; aka dictionaries, hashmaps.
;;;
;;; from "data structures" chapter
;;; https://www.udemy.com/course/common-lisp-programming/?couponCode=BUSYCODERS2025
;;;
;;; bonus: ergonomic flaws & fixes.
;;;
;;; bonus from the video: serialize to a file, read data from a file.
;;;

;;
;; Create.
;;

(make-hash-table)

;;
;; access keys
;;

;; GETHASH returns 2 values:
;; - our result
;; - T if the key was found.

(defparameter *ht* (make-hash-table))

(setf
 (gethash :name *ht*)
 :first-example-hash-table)


;; (ht- TAB

#+(or)
(ql:quickload "alexandria")

(defun pprint-ht (ht)
  (loop for key in (alexandria:hash-table-keys ht)
        :do (format t "~a: ~a~&" key (gethash key ht))))

(loop :for key :being :the :hash-key :of *ht*
      :do (print key))

(maphash (lambda (k v)
           (format t "key ~a = ~a" k v))
         *ht*)



;;
;; Create… with initial data?
;;
(defun make-hash-table-with-data (list-of-key/value-pairs)
  "list-of-key/value-pairs is a list of lists (pairs of key/value)."
  (let ((ht (make-hash-table)))
    (loop for key/val in list-of-key/value-pairs
          :do (setf
               (gethash (first key/val) ;; key
                        ht)
               (second key/val)))
    ht))

;;;
;;; Better ergonomics
;;;

;; Serapeum

#+(or)
(ql:quickload "serapeum")

(defpackage :dict-user
  (:use :cl)
  (:import-from :serapeum
   :dict)
  (:documentation "cl-user + dict"))

(in-package :dict-user)

;; (use-package :serapeum)

;; C-c ~


;;;
;;; Lasting words
;;;

(make-hash-table :test #'string=)

(setf (gethash :key …) :new-val)

(hash-table-count …)

(alexandria:hash-table-keys …)

(maphash (lambda (key val) …) …)

;: I forgot CLRHASH

;;
;; serapeum
;;

(dict :a 1 :2)

(serapeum:toggle-pretty-print-hash-table t)

;; no need of
;;
;; new syntax like {   }
;;
;; new reader macros like #H( … )

;; Bonus:

;; serialize a HT to a file, read from file.

(let ((ht (dict :a 1 :b 2 :c 3)))
  (with-open-file (f "mydict.lisp-expr" :direction :output
                                        :if-exists :supersede
                                        :if-does-not-exist :create)
    (princ ht f)))

;; => the file was created.
;; Look at its content.

;; read the data back:

(let (ht)
  (setf ht (uiop:read-file-form "mydict.lisp-expr"))
  (format t "~&we read our hash-table from a file.~&")
  ht)

;; We can't (de)serialize built-in hash-tables because of the #<…> un-readable representation.
;; DICT allows us to do so.
;; See also serialization libraries (that allow to serialize structs, CLOS objects etc).
