;;;; package.lisp

(cl:in-package :cl-user)

(defpackage :snow.list
  (:use)
  (:export :snow-filter
           :snow-apply-append))

(defpackage :snow.list.internal
  (:use :snow.list :rnrs :srfi-89 :named-readtables :fiveam)
  (:shadowing-import-from :cl :***))

