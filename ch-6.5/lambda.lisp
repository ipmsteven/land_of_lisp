(defun half (n)
  (/ n 2))

;; you can get at the function represented by the word `half` by using the function operator

#'half

(lambda (n) (/ n 2))

(mapcar (lambda (n) (/ n 2)) '(2 4 6))

