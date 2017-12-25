; symbols: case-insensitive
(eq 'fooo 'FooO)

; the integer is "poisoned"
(+ 1 1.0)

(expt 55 55) 

; rational number
(/ 4 6)

(/ 4.0 6)

; string
(princ "hello")
(princ "hello \" escape")

; code mode
(expt 2 3)
; data mode
'(expt 2 3)


; list

; cons
(cons 'chicken 'cat)
(cons 'beef (cons 'chicken ()))

; car
; the car function is used for getting the thing out of the first slot of a cell
(car '(pork beef chicken))

; cdr
; the cdr function is used to grab the value out of the second slot, or the remainder of a list
(cdr '(pork beef chicken))

; cadr, cdar or cadadr
(car (cdr '(pork beef chicken)))
(cadr '(pork beef chicken))

; list function
(list 'pork 'beef 'chicken)
; alternatives
(cons 'pork (cons 'beef (cons 'chicken ())))
(cons 'pork (cons 'beef (cons 'chicken nil)))
'(pork beef chicken)

; nested list
'(cat (duck bat) ant)

; you can use any function with the name c*r right out of box, up to 4 levels deep
