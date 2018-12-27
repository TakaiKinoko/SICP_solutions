#lang scheme

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

; With an interpreter that uses applicative-order, the program will go into an infinite loop because (p)
; is evaluated before it's passed into 'test', given its recursive definition.
; With normal order on the other hand, (p) won't be evaluated until needed, which is when the predicate inside of
; 'test' evaluate to false. In this case, (p) will never be evaluated.

; We learned from 1.1.5 that Scheme interpreter uses applicative-order. 