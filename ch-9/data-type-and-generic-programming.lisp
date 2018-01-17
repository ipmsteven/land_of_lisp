(make-array 3)

(defparameter x (make-array 3))
(aref x 1)

;; generic setter
(setf (aref x 1) 'foo)
x
(aref x 1)

(nth 1 '(foo bar baz))

(defparameter *drink-order* (make-hash-table))
(setf (gethash 'bill *drink-order*) 'double-espresso)
(setf (gethash 'lisa *drink-order*) 'small-drip-coffee)
(setf (gethash 'bill *drink-order*) 'medium-latte)
(gethash 'lisa *drink-order*)

(defun foo ()
  (values 3 7))

(foo)

(+ (foo) 5)

(multiple-value-bind (a b) (foo)
  (* a b))

;; structure

(defstruct person
  name
  age
  waist-size
  favorite-color)
(defparameter *bob* (make-person :name "Bob"
                                 :age 35
                                 :waist-size 32
                                 :favorite-color "blue"))

(person-age *bob*)
(setf (person-age *bob*) 36)

(defmethod add ((a number) (b number))
  (+ a b))
(defmethod add ((a list) (b list))
  (append a b))
(add 3 4)
(add '(a b) '(c d))
