(print 10)  ;;=>  10 
(print "string")  ;;=>  "string" 
(print :symbol)  ;;=>  :SYMBOL 
(print 'whatisthis)  ;;=>  WHATISTHIS 
'(4 :foo t) 
; this is comment
(print "helle world")  ;;=>  "helle world" 

; Variable
; --------

; defparameter
(defparameter *some-variable* 10)
(print *some-variable*)  ;;=>  10 

(defparameter ภาษาไทย 66)
(print ภาษาไทย)  ;;=>  66 

; Let
(print (let ((x 'hello_world)) x))  ;;=>  HELLO_WORLD 

; Datatypes
; ---------

; String ---------------------------------------------
(print 'string)  ;;=>  STRING 
(print (intern "CAPITAL"))  ;;=>  CAPITAL 
(print (intern "aaa"))  ;;=>  |aaa| 

; Numbers -----------------------------------------------
(print 9999)  ;;=>  9999 
(print 99.99)  ;;=>  99.99 

(print #b100)  ;;=>  4 
(print #o100)  ;;=>  64 
(print #x100)  ;;=>  256 
(print 3.134s0)  ;;=>  3.134s0 
(print 3.134d0)  ;;=>  3.134d0 
(print 1/2)  ;;=>  1/2 
(print #C(1 2))  ;;=>  #C(1 2) 

; Function Call -----------------------------------------
(print (+ 1 2))  ;;=>  3 
(print (- 9 1))  ;;=>  8 
(print (* 2 3))  ;;=>  6 
(print (/ 1 2.0))  ;;=>  0.5 
(print (/ 10 2))  ;;=>  5 
(print (expt 2 3))  ;;=>  8 
(print (mod 1 4))  ;;=>  1 
(print (+ #C(1 2) #C(2 3)))  ;;=>  #C(3 5) 

; Boolean -------------------------------------------------
; true
(print t)  ;;=>  T 
; false
(print nil)  ;;=>  NIL 

(print (not t))  ;;=>  NIL 
(print (and 0 t))  ;;=>  T 
(print (or nil t))  ;;=>  T 

; Characters =-------------------------------------------
(print #\A)  ;;=>  #\A 
; simple string
(print "Hello World!")  ;;=>  "Hello World!" 
; concat string
(print (concatenate 'string "hello" " another" " world!" ))  ;;=>  "hello another world!" 
; extract string
(print (elt "hello" 1))  ;;=>  #\e 
; format
(print (format nil "~a! this is a fantasy ~a!" "hello" "world"))  ;;=>  "hello! this is a fantasy world!" Common Lisp.
(print (format t "Common Lisp."))  ;;=>  NIL 

; Structs and Collections
; -----------------------

; Struct ------------------------------------------------
(defstruct person name age)
(defparameter jing (make-person :name "Jing" 
                                :age 99))

(print jing)  ;;=>  #S(PERSON :NAME "Jing" :AGE 99) 
(print (person-p jing))  ;;=>  T 
(print (person-name jing))  ;;=>  "Jing" 
(print (person-age jing))  ;;=>  99 

; Pair --------------------------------------------------
; cons == construct pairs
(print (cons 'Hello 'World))  ;;=>  (HELLO . WORLD) 
(print (car (cons 'First 'Second)))  ;;=>  FIRST 
(print (cdr (cons 'First 'Second)))  ;;=>  SECOND 

; List * the central type --------------------------------
; construct list
(print (list 1 2 4))  ;;=>  (1 2 4) 
(print (cons 1 (cons 2 (cons 3 nil))))  ;;=>  (1 2 3) 
(print '(1 2 4))  ;;=>  (1 2 4) 
; operate list
(print (cons 8 '(1 2 3)))  ;;=>  (8 1 2 3) 
(print (append '(3 4) '(1 2)))  ;;=>  (3 4 1 2) 
(print (concatenate 'list '(1 2) '(3 4)))  ;;=>  (1 2 3 4) 
(print (mapcar #'1+ '(3 4)))  ;;=>  (4 5) 
; 2+ not work why ??
(print (mapcar #'+ '(2 1) '(3 4)))  ;;=>  (5 5) 
; filter list
(print (remove-if-not #'evenp '(1 2 3 4 5)))  ;;=>  (2 4) 
(print (remove-if #'evenp '(1 2 3 4 5)))  ;;=>  (1 3 5) 
; test list
(print (every #'evenp '(1 2 3 4 5)))  ;;=>  NIL 
(print (some #'oddp '(1 2 3 4 5)))  ;;=>  T 
; strip last element
(print (butlast '(a b c)))  ;;=>  (A B) 

; Vector -----------------------------------
(print #(1 2 3))  ;;=>  #(1 2 3) 
(print (concatenate 'vector #(a b c) #(1 2 3)))  ;;=>  #(A B C 1 2 3) 

; Arrays -----------------------------------
; 2D
(print (make-array (list 2 2)))  ;;=>  #2A((NIL NIL) (NIL NIL)) 
(print (make-array '(2) :initial-element "init string"))  ;;=>  #("init string" "init string") 
(print (make-array '(2) :initial-element 'unset))  ;;=>  #(UNSET UNSET) 

; access element
(print (aref (make-array (list 2 2) :initial-element "x") 1 1))  ;;=>  "x" 

(defparameter *vec* (make-array '(3) :initial-contents '(1 2 3) 
                                :adjustable t 
                                :fill-pointer t))

(print *vec*)  ;;=>  #(1 2 3) 
(vector-push-extend 4 *vec*)
(print *vec*)  ;;=>  #(1 2 3 4) 
(vector-push 5 *vec*)
(print *vec*)  ;;=>  #(1 2 3 4 5) 

; set op
(print (set-difference '(1 2 3 4) '(4 5 6 7)))  ;;=>  (1 2 3) 
(print (intersection '(1 2 3 4) '(4 5 6 7)))  ;;=>  (4) 
(print (union '(1 2 3 4) '(4 5 6 7)))  ;;=>  (1 2 3 4 5 6 7) 
(print (adjoin 3 '(4 5 6 7)))  ;;=>  (3 4 5 6 7) 

; Dict or Hash ----------------------------------
(defparameter *m* (make-hash-table))
(print *m*)  ;;=>  #S(HASH-TABLE :TEST FASTHASH-EQL) 
(setf (gethash 'a *m*) 'first)
(print *m*)  ;;=>  #S(HASH-TABLE :TEST FASTHASH-EQL (A . FIRST)) 
(print (gethash 'a *m*))  ;;=>  FIRST 
; get not existing hash
(print (gethash 'b *m*))  ;;=>  NIL 
; if not exist retrun with default
(print (gethash 'd *m* "not-found"))  ;;=>  "not-found" 
; multiple return
; like a, b = split(something) in pyhon
(print (multiple-value-bind (a b)  ;;=>  (FIRST T) 
         (gethash 'a *m*) 
         (list a b)))

; Function
; ========

; use lambda to create anonymous functions.
; its return the value of the last line;
(print (lambda () "hello world"))  ;;=>  #<FUNCTION :LAMBDA NIL "hello world"> 
(print (funcall (lambda () "test return")))  ;;=>  "test return" 
(defun hello-world () "hello world")
(defparameter *retval* (hello-world))
(print *retval*)  ;;=>  "hello world" 

(defun hello (name)
  (format nil "Hello my name is ~a." name))
(defparameter *retval* (hello :jing))
(print *retval*)  ;;=>  "Hello my name is JING." 

; optional args
(defun hellox (name &optional from)
             (if from (format nil "Hello, ~a, from, ~a" name from)
                      (format nil "Hello, ~a." name)))

(print (hellox 'jing))  ;;=>  "Hello, JING." 
(print (hellox :jing :joo))  ;;=>  "Hello, JING, from, JOO" 

; keywords args
(defun greeter (name &key (from "Receptionist") (honorific "Miss"))
       (format nil "Hello ~a, This is ~a ~a, How are you today?" name honorific from))

(print (greeter "Jing"))  ;;=>  "Hello Jing, This is Miss Receptionist, How are you today?" 
(print (greeter "Jack" :from "Nut" :honorific "Mr."))  ;;=>  "Hello Jack, This is Mr. Nut, How are you today?" 


; Equity Compare
; ==============

(print (= 1 2))  ;;=>  NIL 
(print (= 1 1.0))  ;;=>  T 
; eql use the test object identitiy
(print (eql 1 1.0))  ;;=>  NIL 
(print (eql (list 1) (list 1)))  ;;=>  NIL 

; use equal to test in list
(print (equal (list 'a 'b) (list 'a 'b)))  ;;=>  T 
(print (equal (list 'a 'b) (list 'b 'a)))  ;;=>  NIL 

; Control Flow
; ============
(print (if t "this is true" "this is false"))  ;;=>  "this is true" 
; test member in list
(print (member 'b '(a b c)))  ;;=>  (B C) 

(defparameter l '(a b c d e))
(print (member 'b l))  ;;=>  (B C D E) 
(print (if (member 'b l) "b is in the list" "b is not in the list"))  ;;=>  "b is in the list" 
(print (if (member 'g l) "g is in the list" "g is not in the list"))  ;;=>  "g is not in the list" 

; case when syntax
(print (cond ((> 2 2) (error "wrong!" ))  ;;=>  "pass" 
             ((< 2 2) (error "that's wrong!"))
          (t "pass")))

(print (cond  ;;=>  "else nothing in the list" 
         ((member 'g l) "list is in the cases")
         ((member 't l) "list is in the cases")
         ("else nothing in the list")))

; test datatype of variable
(defparameter v "1")
(print (typecase v  ;;=>  STRING 
          (string 'string)
          (integer :int)))
(print v)  ;;=>  "1" 

; Iteration

(defun walker (n)
  (if (zerop n) :walked (walker (1- n))))
(print (walker 4))  ;;=>  :WALKED 

; for i in list
(dolist (i '(a b c))
  (format nil "~a in the list" i))

; loop
(print (loop for i from 0 below 10 collect (* 2 i)))  ;;=>  (0 2 4 6 8 10 12 14 16 18) 

; Mutation

; use let for local scope 
; and setf to alter value of a variable
; try to mutate variable "v" in above
(print (let ((v 10)) (setf v 20) v))  ;;=>  20 
(print v)  ;;=>  "1" 

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

