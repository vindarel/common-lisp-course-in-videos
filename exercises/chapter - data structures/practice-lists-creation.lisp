
;;;
;;; Practice with the code snippets below.
;;; Run them, tweak them.
;;; Run them from the terminal, or explore your editor.
;;;
;;; Those are the snippets from the video, and a few more.
;;;

(list 1 2 3)

(list :one "two" (list 3))

(make-list 3)

(fill (make-list 3) 42)

(make-list 3 :initial-element "hello")

(defparameter *name* "you")

(list *name*)

'(*name*)

(list (quote *name*))

(quote (list *name*))

(quote (*name*))

(quote (one "two" (list 3)))

(quote (one "two" (3)))


;;;
;;; property lists (plist)
;;;

(defparameter *plist* (list :key "foo" :key2 "bar"))

(getf *plist* :key)

;; remove an element: destructive
(remf *plist* :key2)



;;;
;;; association lists (alist)
;;;

(defparameter *my-alist* (list (cons :foo "foo")
                               (cons :bar "bar")))

'((:foo . "foo") (:bar . "bar"))

(list (cons :name *name*)
      (cons :name "me"))

;; with backquote and comma: ' `
`((:name . ,*name*) (:name . "me"))

;; access:
(assoc :foo *my-alist*)

(cdr (assoc :foo *my-alist*))

#+(or)
(ql:quickload "alexandria")

;; key -> val
(alexandria:assoc-value *my-alist* :foo)

;; val -> key
(alexandria:rassoc-value *my-alist* "foo")
(alexandria:rassoc-value *my-alist* "foo" :test #'equal)
