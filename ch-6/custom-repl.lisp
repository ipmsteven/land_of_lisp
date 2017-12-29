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
