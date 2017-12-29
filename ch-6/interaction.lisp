(print "foo")

(progn (print "this")
       (print "is")
       (print "a")
       (print "test"))


(progn (prin1 "this")
       (prin1 "is")
       (prin1 "a")
       (prin1 "test"))

(defun say-hello ()
  (print "Please type your name:")
  (let ((name (read)))
    (print "Nice to meet you, ")
    (print name)))
;; (say-hello)

(defun add-five ()
  (print "please enter a number:")
  (let ((num (read)))
        (print "When I add five I get")
        (print (+ 5 num))))

;; (add-five)

(print '3)
(print '3.4)
(print 'foo)
(print '"foo")
(print '#\a)

;; Lisp also has special literal defined for nonvisible characters

(print '#\newline)
(print '#\tab)
(print '#\space)

;; The symbol |CaseSensitiveSymbol| will retain its case
'|AbCd , ? !|

;; Lisp has a command that can print pieces of data in a way that is appealing to humans.
;; The princ function can take any piece of Lisp data, and it tries to print data in a
;; way humans would prefer. It will do the basic things you might expect: leave off the
;; quotes on a string, print characters in their raw form, and so on.

(princ '3)
(princ '3.4)
(princ 'foo)
(princ '"foo")
(princ '#\a)
(progn (princ "This sentence will be interrupted")
       (princ #\newline)
       (princ "by an annoying newline character."))


;; read-line just let user type in whatever they want until they hit ENTER key, then
;; treat the whole thing as a string. However, it has none of the sophistication of
;; the read print, and princ functions, since it knows about nothing beyond characters
;; strings.

(defun say-hello-read-line ()
  (princ "Please type your name:")
  (let ((name (read-line)))
    (princ "Nice to meet you, ")
    (princ name)))
(say-hello-read-line)

;; code and data

(defparameter *foo* '(+ 1 2))
(eval *foo)

