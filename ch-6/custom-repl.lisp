(defun game-repl ()
  (loop (print (eval (read)))))

;; (game-repl)

(defun game-repl-2 ()
  (let ((cmd (game-read)))
    (print cmd)
    (unless (eq (car cmd) 'quit)
      (game-print (game-eval cmd))
      (game-repl-2))))

(game-repl-2)

(defun game-read ()
  (let ((cmd (read-from-string
              (concatenate 'string "(" (read-line) ")"))))
    (flet ((quote-it (x)
             (list 'quote x)))
      (cons (car cmd) (mapcar #'quote-it (cdr cmd))))))
(game-read)

(defparameter *allowed-commands* '(look walk pickup inventory))
(defun game-eval (sexp)
  (if (member (car sexp) *allowed-commands*)
      (eval sexp)
      '(i do not know that command.)))
