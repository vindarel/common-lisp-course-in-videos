;; What you know:
;; error, warn,  (signal (make-condition 'simple-condition))

;; What we see: how to "catch" (handle) conditions.

(defun f0 (&optional arg)
  "Signal an error."
  (error "my error happened. Arg was: ~a" arg))

(defun f1 (&optional arg)
  (f0 arg))

(defun f2 (&optional arg)
  (f1 arg))

(defparameter *count* 0
  "Count errors.")

(define-condition my-simple-condition (simple-condition)
  ()
  (:report (lambda (c stream)
             (declare (ignore c))
             (format stream "this is my ~:R error" *count*))))

(define-condition my-division-by-zero-error (simple-error)
  ((dividend :initarg :dividend
             :initform nil
             :reader dividend))
  (:report (lambda (c stream)
             (format stream "Math error! Dividing ~a by zero." (dividend c)))))

(defun make-my-condition (arg-list)
  (make-condition 'my-simple-condition))

(defun divide (num denum)
  (when (= denum 0)
    (error 'my-division-by-zero-error :dividend num))
  (/ num denum))

(defun do-it ()
  "How do we handle conditions?"
  (handler-case

      (divide 3 0)

    ;; (signal 'my-simple-condition
    ;;         ;; :format-control "this is my ~:R error."
    ;;         ;; :format-arguments (list *count*)
    ;;         )
    ;; (signal
    ;; 'my-simple-condition)

    (my-division-by-zero-error (c)
      (log:info "Oops: ~a" c)
      c)
    (error (c)
      (log:info "We got an error" c))
    (warning (c)
      (log:info "We got a warning:" c))
    (simple-condition (c)
      (format t "we got: ~a" c)
      ;; c
      )))
