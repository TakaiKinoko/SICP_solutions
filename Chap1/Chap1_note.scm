#lang scheme
(#%require racket/trace)
(provide (except-out (all-defined-out)
                         sqrt-iter sqrt test1 test2 test3))    ; so that a new definition can be given in 1.6

;; Newton's method
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (/ (+ guess (/ x guess)) 2))

(define (good-enough? guess x)
  (< (abs (- (* guess guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;;tests
(define test1 (sqrt 9))
(define test2 (sqrt 2))
(define test3 (expt (sqrt 1000) 2))
