(print 10)
(print "string")
(print :symbol)
(print 'whatisthis)
'(4 :foo t) 
; this is comment
(print "helle world")

; Variable
; --------

; defparameter
(defparameter *some-variable* 10)
(print *some-variable*)

(defparameter ภาษาไทย 66)
(print ภาษาไทย)

; Let
(print (let ((x 'hello_world)) x))

; Datatypes
; ---------

; String ---------------------------------------------
(print 'string)
(print (intern "CAPITAL"))
(print (intern "aaa"))

; Numbers -----------------------------------------------
(print 9999)
(print 99.99)

(print #b100)
(print #o100)
(print #x100)
(print 3.134s0)
(print 3.134d0)
(print 1/2)
(print #C(1 2))

; Function Call -----------------------------------------
(print (+ 1 2))
(print (- 9 1))
(print (* 2 3))
(print (/ 1 2.0))
(print (/ 10 2))
(print (expt 2 3))
(print (mod 1 4))
(print (+ #C(1 2) #C(2 3)))

; Boolean -------------------------------------------------
; true
(print t)
; false
(print nil)

(print (not t))
(print (and 0 t))
(print (or nil t))

; Characters =-------------------------------------------
(print #\A)
; simple string
(print "Hello World!")
; concat string
(print (concatenate 'string "hello" " another" " world!" ))
; extract string
(print (elt "hello" 1))
; format
(print (format nil "~a! this is a fantasy ~a!" "hello" "world"))
(print (format t "Common Lisp."))

; Structs and Collections
; -----------------------

; Struct ------------------------------------------------
(defstruct person name age)
(defparameter jing (make-person :name "Jing" 
                                :age 99))

(print jing)
(print (person-p jing))
(print (person-name jing))
(print (person-age jing))

; Pair --------------------------------------------------
; cons == construct pairs
(print (cons 'Hello 'World))
(print (car (cons 'First 'Second)))
(print (cdr (cons 'First 'Second)))

; List * the central type --------------------------------
; construct list
(print (list 1 2 4))
(print (cons 1 (cons 2 (cons 3 nil))))
(print '(1 2 4))
; operate list
(print (cons 8 '(1 2 3)))
(print (append '(3 4) '(1 2)))
(print (concatenate 'list '(1 2) '(3 4)))
(print (mapcar #'1+ '(3 4)))
; 2+ not work why ??
(print (mapcar #'+ '(2 1) '(3 4)))
; filter list
(print (remove-if-not #'evenp '(1 2 3 4 5)))
(print (remove-if #'evenp '(1 2 3 4 5)))
; test list
(print (every #'evenp '(1 2 3 4 5)))
(print (some #'oddp '(1 2 3 4 5)))
; strip last element
(print (butlast '(a b c)))

; Vector -----------------------------------
(print #(1 2 3))
(print (concatenate 'vector #(a b c) #(1 2 3)))

; Arrays -----------------------------------
; 2D
(print (make-array (list 2 2)))
(print (make-array '(2) :initial-element "init string"))
(print (make-array '(2) :initial-element 'unset))

; access element
(print (aref (make-array (list 2 2) :initial-element "x") 1 1))

(defparameter *vec* (make-array '(3) :initial-contents '(1 2 3) 
                                :adjustable t 
                                :fill-pointer t))

(print *vec*)
(vector-push-extend 4 *vec*)
(print *vec*)
(vector-push 5 *vec*)
(print *vec*)

; set op
(print (set-difference '(1 2 3 4) '(4 5 6 7)))
(print (intersection '(1 2 3 4) '(4 5 6 7)))
(print (union '(1 2 3 4) '(4 5 6 7)))
(print (adjoin 3 '(4 5 6 7)))

; Dict or Hash ----------------------------------
(defparameter *m* (make-hash-table))
(print *m*)
(setf (gethash 'a *m*) 'first)
(print *m*)
(print (gethash 'a *m*))
; get not existing hash
(print (gethash 'b *m*))
; if not exist retrun with default
(print (gethash 'd *m* "not-found"))
; multiple return
; like a, b = split(something) in pyhon
(print (multiple-value-bind (a b)
         (gethash 'a *m*) 
         (list a b)))

; Function
; ========

; use lambda to create anonymous functions.
; its return the value of the last line;
(print (lambda () "hello world"))
(print (funcall (lambda () "test return")))
(defun hello-world () "hello world")
(defparameter *retval* (hello-world))
(print *retval*)

(defun hello (name)
  (format nil "Hello my name is ~a." name))
(defparameter *retval* (hello :jing))
(print *retval*)

; optional args
(defun hellox (name &optional from)
             (if from (format nil "Hello, ~a, from, ~a" name from)
                      (format nil "Hello, ~a." name)))

(print (hellox 'jing))
(print (hellox :jing :joo))

; keywords args
(defun greeter (name &key (from "Receptionist") (honorific "Miss"))
       (format nil "Hello ~a, This is ~a ~a, How are you today?" name honorific from))

(print (greeter "Jing"))
(print (greeter "Jack" :from "Nut" :honorific "Mr."))


; Equity Compare
; ==============

(print (= 1 2))
(print (= 1 1.0))
; eql use the test object identitiy
(print (eql 1 1.0))
(print (eql (list 1) (list 1)))

; use equal to test in list
(print (equal (list 'a 'b) (list 'a 'b)))
(print (equal (list 'a 'b) (list 'b 'a)))

; Control Flow
; ============
(print (if t "this is true" "this is false"))
; test member in list
(print (member 'b '(a b c)))

(defparameter l '(a b c d e))
(print (member 'b l))
(print (if (member 'b l) "b is in the list" "b is not in the list"))
(print (if (member 'g l) "g is in the list" "g is not in the list"))

; case when syntax
(print (cond ((> 2 2) (error "wrong!" ))
             ((< 2 2) (error "that's wrong!"))
          (t "pass")))

(print (cond
         ((member 'g l) "list is in the cases")
         ((member 't l) "list is in the cases")
         ("else nothing in the list")))

; test datatype of variable
(defparameter v "1")
(print (typecase v
          (string 'string)
          (integer :int)))
(print v)

; Iteration

(defun walker (n)
  (if (zerop n) :walked (walker (1- n))))
(print (walker 4))

; for i in list
(dolist (i '(a b c))
  (format nil "~a in the list" i))

; loop
(print (loop for i from 0 below 10 collect (* 2 i)))

; Mutation

; use let for local scope 
; and setf to alter value of a variable
; try to mutate variable "v" in above
(print (let ((v 10)) (setf v 20) v))
(print v)

; Class and Object
; ================

; (defclass name (superclasses) (slot) (option) )
(defclass cls-person ()
  ((name :accessor name :initarg :name)
    (age :accessor age :initarg :age))
  (:documentation "This is person class."))

(defclass student (cls-person)
  ((grade :accessor grade :initarg :grade)))

;(describe 'cls-person)

