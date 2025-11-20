
;;;
;;; Getting to know the built-in sequence-manipulation functions.
;;;
;;; Run each line to understand what the functions do.
;;;
;;; reference:
;;; https://lispcookbook.github.io/cl-cookbook/data-structures.html
;;;
;;; Use your editor to see the functions' signature. You don't need to remember.
;;;

(defparameter *list* (list 0 :one "two" (make-hash-table) 'three))

;;;
;;; These functions work on sequences, not only lists.
;;;

(length *list*)

(elt *list* 0)

(count 0 *list*)

(subseq *list* 1)
(subseq *list* 1 3)
(subseq *list* 1 100)

#+(or)
(ql:quickload "alexandria")
(alexandria-2:subseq* *list* 1 100)

(sort (list 1 4 2 5 3) #'<)

(sort (list "a" "c" "b") #'string<)

(defparameter *list-of-pairs* '((1 9) (2 8) (3 7)))

(sort (copy-seq *list-of-pairs*) #'< :key #'second)

(fill (make-list 3) 1)

(defparameter *void-list* (make-list 3))

(substitute 1 nil *void-list*)
*void-list*

;; destructive (non-consing)
(nsubstitute 2 nil *void-list*)
*void-list*

(position "foo" (list "hey" "foo" "bar"))

(position "foo" (list "hey" "foo" "bar") :test #'equal)

;; see the "equality: working with strings gotcha" video.
(eql "one" "one")
(equal "one" "one")

(position :one *list*)
(elt *list* 1)
(find :one *list*)
(member :one *list*)
(member 'three *list*)

(search (list :one) *list*)

(mismatch (list 0 :one 42) *list*)

;; MERGE
;; to explore…

;; REPLACE
;; to explore…
;; frankly, I never used it.
;; I use
;; (str:replace-all old new s)
;; for strings.

(remove :one *list*)
;; delete: destructive

(remove-duplicates (list 1 1 2 3 1 3 2 2 3))

(remove-duplicates (list 1 1 2 3 1 3 2 2 3) :end 3)

(remove-duplicates (list 1 1 2 3 1 3 2 2 3) :start 3)

(remove-duplicates (list 1 1 2 3 1 3 2 2 3) :start 3 :end 6)


;;;
;;; mapping
;;;

(reduce #'+ (make-list 3 :initial-element 1))

(defun =1 (i)
  (= i 1))

(remove-if #'=1 (list 1 2 3 1 1))

;; "filter"
(remove-if-not #'=1 (list 1 2 3 1 1))

(mapcar #'1+ (list 1 2 3))

#+(or)
(ql:quickload "alexandria")
(alex:flatten '(a (b (c d) e (f g))))


;;;
;;; Functions for lists as sets.
;;;

(intersection (list 1 2 3) (list 3 4 5))

(set-difference (list 1 2 3) (list 3 4 5))

(union (list 1 2 3) (list 3 4 5))

(set-exclusive-or (list 1 2 3) (list 3 4 5))

(adjoin 3 (list 1 2 3))

(adjoin 4 (list 1 2 3))
;; or pushnew, destructive.

(subsetp (list 1 2) (list 1 2 3))
(subsetp (list 1 2 2 2) (list 1 2 3))

;;;
;;; Now go explore:
;;; alexandria
;;; serapeum
