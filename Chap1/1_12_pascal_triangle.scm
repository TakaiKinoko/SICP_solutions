#lang scheme

; param: l - level of the triangle, i - index into this level
; output: an individual element of the triangle specified by the indices l and i 
; e.g. pascal 3 2 = 2, pascal 5 2 = 4
; constraint: i < l  (each level l has l elements. i is 1-based) 
(define (pascal l i)
  (cond ((or (= l 1) (= l 2)) 1)   ; first 2 levels are all 1's
        ((or (= i 1) (= i l)) 1)   ; edges of the triangle are all 1's
        (else (+ (pascal (- l 1) (- i 1))
                 (pascal (- l 1) i)))))

; tests
(pascal 3 2)
(pascal 4 2)
(pascal 4 3)
(newline)
(pascal 5 1)
(pascal 5 2)
(pascal 5 3)
(pascal 5 4)
(pascal 5 5)