;;
;; What you know:
;; error, warn, simple-condition, signal, handler-case
;;
;; What we see:
;; how to define our own conditions.
;;

(defparameter *count* 0
  "Count our errors.")

(define-condition my-division-by-zero-error (error)
  ((num :initarg :num
        :initform nil
        :reader num))
  (:report (lambda (c stream)
             (format stream "Math error! We want to divide ~a by zero"
                     (num c)))))

(defun divide (num denum)
  (when (= 0 denum)
    (signal 'my-division-by-zero-error :num num))
  (/ num denum))

(defun do-it ()
  (handler-case
      (divide 3 0)
    (my-division-by-zero-error (c)
      (log:info "We got: ~a" c)
      c)))
