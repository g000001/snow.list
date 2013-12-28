;;;; snow.list.lisp

(cl:in-package :snow.list.internal)
;; (in-readtable :snow.list)

(def-suite snow.list)

(in-suite snow.list)

;;; "snow.list" goes here. Hacks and glory await!


(define-syntax package*
  (syntax-rules (:provide
                 :maintainer
                 :author
                 :homepage
                 :description
                 :keywords
                 :license)
    ((package* name (:provide item ***) spec ***)
     (package* name spec ***))
    ((package* name (:maintainer item) spec ***)
     (begin 
       (cl:setf (asdf:system-maintainer (asdf:find-system name)) item)
       (package* name spec ***)))
    ((package* name (:author item) spec ***)
     (begin
       (cl:setf (asdf:system-author (asdf:find-system name)) item) 
       (package* name spec ***)))
    ((package* name (:homepage item) spec ***)
     (begin
       (cl:setf (asdf:system-homepage (asdf:find-system name)) item) 
       (package* name spec ***)))
    ((package* name (:description item) spec ***)
     (begin
       (cl:setf (asdf:system-description (asdf:find-system name))
                item)
       (package* name spec ***)))
    ((package* name (:keywords item ***) spec ***)
     (package* name spec ***))
    ((package* name (:license v) spec ***)
     (begin 
       (cl:setf (asdf:system-licence (asdf:find-system name))
                (symbol->string 'v))
       (package* name spec ***)))
    ((package* name spec ***)
     (begin 'name spec ***))))


;;; *EOF*

