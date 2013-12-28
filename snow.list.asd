;;;; snow.list.asd -*- Mode: Lisp;-*- 

(cl:in-package :asdf)

(defsystem :snow.list
  :serial t
  :depends-on (:fiveam
               :named-readtables
               :rnrs-compat
               :srfi-89)
  :components ((:file "package")
               (:file "snow.list")
               (:file "v1.0.0/snow/list")))

(defmethod perform ((o test-op) (c (eql (find-system :snow.list))))
  (load-system :snow.list)
  (or (flet ((_ (pkg sym)
               (intern (symbol-name sym) (find-package pkg))))
         (let ((result (funcall (_ :fiveam :run) (_ :snow.list.internal :snow.list))))
           (funcall (_ :fiveam :explain!) result)
           (funcall (_ :fiveam :results-status) result)))
      (error "test-op failed") ))

