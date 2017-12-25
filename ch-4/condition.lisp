;; empty list equals false

(if '()
    'i-am-true
    'i-am-false)

(if '(1)
    'i-am-true
    'i-am-false)

(defun my-length (list length)
  (if list
      (my-length (cdr list) (1+ length))
      length))

(my-length '(1 2 3 4) 0)

;; Four disguies of ()
;; Not only does the empty list evaluate to false, but it is the only false value in Common Lisp. Any value not equivalent to an empty list will be considered a true value.

(eq '() nil)
(eq '() ())
(eq '() 'nil)

;; IF
;; * only one of the expressions after the if is actually evaluated
;; * we can only do one thing in an if statement

(if (= (+ 1 2) 3)
    'yup
    'nope)

(if (= (+ 1 2) 4)
    'yup
    'nope)

(if '(1)
    'the-list-has-stuff-in-it
    'the-list-is-empty)

(if '()
    'the-list-has-stuff-in-it
    'the-list-is-empty)

(if (oddp 5)
    'odd-number
    'even-number)

(defvar *number-was-odd* nil)
(if (oddp 5)
    (progn (setf *number-was-odd* t)
           'odd-number)
    'even-number)
*number-was-odd*

;; WHEN and UNLESS
;; since it's kind of pain to use 'progn' every time you want to do multiple things inside an if, Lisp has several other commands that include an implicit progn. The trade-off is that these commands can't do anything when the condition evaluates in the opposite way; they just return nil and do nothing

(defvar *number-is-odd* nil)
(when (oddp 5)
  (setf *number-is-odd* t)
  'odd-number)
(unless (oddp 4)
  (setf *number-is-odd* nil)
  'even-number)

;; COND
;; The cond form is the classic way to do branching in lisp. Through the liberal use of parentheses, it allows for an implicit progn, can handle more than one branch, and can even evaluate several conditions in succession. Since cond has been around since the Lisp Stone Age, and it's comprehensive in its abilities, many lisp programmers consider it to be the one true lisp conditional.

(defvar *arch-enemy* nil)
(defun pudding-eater (person)
  (cond ((eq person 'henry) (setf *arch-enemy* 'stupid-lisp-alien)
         '(curse you lisp alien - you ate my pudding))
        ((eq person 'johnny) (setf *arch-enemy* 'useless-old-johnny)
         '(I hope you choked on my pudding johnny))
        (t '(why you eat my pudding stranger ?))))
(pudding-eater 'johnny)
(pudding-eater 'tom)
(pudding-eater 'henry)


;; CASE
;; The case form is common to use the eq function for conditionals.

(defvar *arch-enemy* nil)
(defun pudding-eater-2 (person)
  (case person
    ('henry (setf *arch-enemy* 'stupid-lisp-alien)
     '(curse you lisp alien - you ate my pudding))
    ('johnny (setf *arch-enemy* 'useless-old-johnny)
     '(I hope you choked on my pudding johnny))
    (otherwise '(why you eat my pudding stranger ?))))

(pudding-eater-2 'johnny)
(pudding-eater-2 'tom)
(pudding-eater-2 'henry)

;; AND and OR
(and (oddp 5) (oddp 7) (oddp 9))
(or (oddp 8) (oddp 7) (oddp 9))

;; Shortcut Boolean Evaluation
(defparameter *is-it-even* nil)
(or (oddp 4) (setf *is-it-even* t))

;; Version 1
;; (if *file-modified*
;;     (if (ask-user-about-saving)
;;         (save-file)))

;; Version 2
;; (and *file-modified* (ask-user-about-saving) (save-file))

;; Version 3
;; (if (and *file-modified*
;;          (ask-user-about-saving))
;;     (save-file))

;; MEMBER

(if (member 1 '(2 4 1 5))
    'one-is-in-the-list
    'one-is-not-in-the-list)

(if (member nil '(2 nil 1 5))
    'nil-is-in-the-list
    'nil-is-not-in-the-list)

;; FIND-IF

(find-if #'oddp '(2 3 5 6))
(if (find-if #'oddp '(2 3 5 6))
    'there-is-an-odd-number
    'there-is-no-odd-number)

;; small, ugly wart in find-if for nil case
;; The null function, which returns true for any of the nil values, correctly find the nil. Unfortunately, in this one annoying case, we would not want to use find-if inside a conditional statement, because a correctly found valuestill returns a result that evaluates as false.
(find-if #'null' '(2 4 nil 6))

;; Comparing stuff
;; Conrad's rule of thumb for comparing stuff:
;;  1. use 'eq' to compare symbols
(eq 'apple 'apple)
;;  2. use 'equal' for everything else
(equal 'apple 'apple)
(equal (list 1 2 3) (list 1 2 3))
(equal '(1 2 3) (cons 1 (cons 2 (cons 3 ()))))
(equal 5 5)
(equal 5.1 5.1)
(equal "foo" "foo")
(equal #\a #\a)

;; The 'eql' command is similar to the 'eq' command, but unlike 'eq', it also handles comparisons of numbers and characters

;; comparing symbols
(eql 'foo 'foo)

;; comparing numbers
(eql 3.4 3.4)

;; comparing characters
(eql #\a #\a)

;; The 'equalp' command is essentially the same as the 'equal' command, except that it can handle some difficult comparisons case with a bit of sophistication.

;; comparing string with diffrent CAPS
(equalp "Bob Smith" "bob smith")

;; comparing integers against floating numbers
(equalp 5.0 5)

;; The remaining comparison commands are just specializations for specific datatypes. Otherwise, they are similar to 'equal'.
;; For instance, the '=' function handles numbers, 'string-equal' handles strings, and 'char-equal' handles characters.
