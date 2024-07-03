;;
;; Common Lisp Condition System
;;
;; unwind-protect:
;; guarantee the execution of some code
;; even if an error occurs inside its protected form.
;;

(unwind-protect
     (progn
       ;; (log:info "This works.")
       ;; (values 1
       ;;         t)

       (error "noop")
       :a-return-value)
  (progn
    (format t "oof. This place is safe.")))

(block nil
  (unwind-protect
       (error "noop")
    (return 1)))

(defun with-or ()
  (or (unwind-protect (error "nope")
        (format t "just a side effect"))
      (return-from 'with-or 2)))

(let ((val 1))
  (unwind-protect (error "nope")
    (setf val 2))
  val)










;;
;; Common Lisp Condition System
;;
;; unwind-protect
;;

(unwind-protect )
