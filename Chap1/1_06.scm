#lang scheme

(require "Chap1_note.scm")
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

;(define (sqrt-iter guess x)
;  (new-if (good-enough? guess x)
;          guess
;          (sqrt-iter (improve guess x)
;                     x)))

;(define (sqrt x)
;  (sqrt-iter 1.0 x))


;(sqrt 9)
;(sqrt (+ 100 37))
;(sqrt (+ (sqrt 2) (sqrt 3)))

;; The newly defined sqrt based on new-if will not terminate. No value is going to be returned.
;; This is because the then-clause and else-clause are treated as a typical lisp function which uses
;; pass-by-value to pass parameters into the function. As a result, at each iteration (sqrt-iter) will be
;; evaluated no matter the guess is good enough or not, causing recursion to go down infinitely.

;; a good reference: https://github.com/huangz1990/SICP-answers/blob/master/chp1/6.rst