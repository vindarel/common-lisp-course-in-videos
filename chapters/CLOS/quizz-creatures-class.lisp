
(defclass creature ()
  ((name :initarg :name
         :initform ""
         :accessor name)
   (life :initform nil
         :accessor life)))

(defclass human (creature)
  ((life :initform 80)))

(defclass orc (creature)
  ((life :initform 30)))

(defmethod smalltest ((obj t))
  (print obj))

;; TODO: can you use DEFMETHOD(s) instead of this manual dispatch?
(defun hit (creature)
  (cond
    ((equal 'human (type-of creature))
     -8)
    ((equal 'orc (type-of creature))
     -5)
    (t
     (error "unknown creature type: ~a" (type-of creature)))))
