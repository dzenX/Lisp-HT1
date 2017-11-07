(defpackage :homework1/list_sort
  (:use :common-lisp)
  (:export #:my-flatten))
(in-package :homework1/list_sort)

(defun isort(lst &optional (res nil))
  (labels ((%insert(lst x)
	     (cond 
	       ((null lst) (list x))
	       ((> (car lst) x) (cons x lst))
	       (T (cons (car lst) (%insert (cdr lst) x))))))
    (cond
      ((null lst) res)
      (T (isort (cdr lst) (%insert res (car lst)))))))

(defun csort (lst)
  (labels ((%find-min(x y)
	     (if (< x y) 
		 x
		 y))
	   (%find-min-lst(lst)
	     (cond
	       ((= (length lst) 1) (car lst))
	       ((= (length lst) 2) (%find-min (car lst) (cadr lst)))
	       (T (%find-min (car lst) (%find-min-lst (cdr lst))))))
	   (%delete (x lst)
	     (cond
	       ((null lst) nil)
	       ((EQ x (car lst)) (cdr lst))
	       (T (cons (car lst) (%delete x (cdr lst)))))))
    (unless (null lst)
      (cons (%find-min-lst lst) (csort (%delete (%find-min-lst lst) lst))))))


      