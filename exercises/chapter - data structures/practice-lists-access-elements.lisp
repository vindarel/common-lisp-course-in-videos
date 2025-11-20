

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

