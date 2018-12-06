#lang scheme

(require racket/include)
(require "2_7.scm")

(define (sub-interval x y)
  (let ((lower (- (lower-bound x)(upper-bound y)))
        (upper (- (upper-bound x)(lower-bound y))))
  (make-interval lower upper)))

;; tests
(define i1 (make-interval 9.0 10.0))  ; sign + +
(define i2 (make-interval -8.9 -8.0)) ; sign - -
(sub-interval i1 i2)
(define i3 (make-interval -9.0 -8.0)) ; sign - - 
(define i4 (make-interval -0.5 1.0))  ; sign - +
(sub-interval i3 i4)

(provide (all-defined-out)) ; 