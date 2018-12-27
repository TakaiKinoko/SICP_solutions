#lang scheme

; the 9 cases: (+ +) * (+ +) / (+ +) * (- +) / (+ +) * (- -) / 
; (- +) * (+ +) / (- +) * (- +) / (- +) * (- -) / (- -) * (+ +) /
; (- -) * (- +) / (- -) * (- -)

; the only case that needs more than two multiplications is
; (- +) * (- +)

(define (sign x)
  (if (> x 0) "+" "-"))

(define (mul-interval x y)
  (let ((l1 (lower-bound x))
        (u1 (upper-bound x))
        (l2 (lower-bound y))
        (u2 (upper-bound y)))
    (match (cons (sign x) (sign y))
       ()
       ()
       ()
       ()
       ()))) 