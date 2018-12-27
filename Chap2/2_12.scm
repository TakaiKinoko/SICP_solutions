#lang scheme
(require racket/include)
(require "2_7.scm")

; percentage tolerance is defined as the width of the interval
; divided by the midpoint of the interval

;constructor
(define (make-center-percent c p)
  (let ((half (/ (* c p) 2)))
    (make-interval (- c half) (+ c half))))

;tests
(make-center-percent 100 0.5)
(make-center-percent 1 0.2)