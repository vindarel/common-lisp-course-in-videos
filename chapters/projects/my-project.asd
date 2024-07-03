(in-package #:asdf-user)

(defsystem :my-project
  :description "System example."
  :author "vindarel"
  ;; more metadata…
  :depends-on (:alexandria :str :cl-ppcre :clingon)
  :components ((:file "my-project")  ;; .lisp file
               (:static-file "README.md"))
  ;; build a binary:
  ;; (build with asdf:make)
  :build-operation "program-op"
  :build-pathname "my-project"
  :entry-point "my-project::main")
