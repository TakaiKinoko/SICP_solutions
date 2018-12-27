#lang scheme

(require racket/include)
(require "2_7.scm")
(require "2_8.scm")

; first define width of an interval as half of the difference between its upper and lower bounds
(define (width-interval i) (/ (- (upper-bound i) (lower-bound i)) 2))

; then show that the width of the sum/difference of two intervals is a function only of the widths of the intervals being added/substracted

; 1- add

;(define (add-interval x y)
;   (make-interval (+ (lower-bound x) (lower-bound y))
;                  (+ (upper-bound x) (upper-bound y))))
;
;  use substitution model: 
;  (width-interval (add-interval x y))
;= (/ ( - (upper-bound (add-interval x y)) (lower-bound (add-interval x y))) 2)
;= (/ ( - ( + (upper-bound x) (upper-bound y)) (+ (lower-bound x) (lower-bound y))) 2)
; we know that (x + y) - (m + n) =  (x - m) + (y - n), thus the above cound be transformed into
;= (/ ( + (- (upper-bound x) (lower-bound x)) (- (upper-bound y) (lower-bound y))) 2)
; then use distributive law of multiplication
;= (+ (/ (- (upper-bound x) (lower-bound x)) 2) (/ (- (upper-bound y) (lower-bound y)) 2))
;= (+ (width-interval x) (width-interval y))

; Thus proved that the width of the sum of two intervals is the sum of the widths of the them

; 2 - sub
; (define (sub-interval x y)
;  (let ((lower (- (lower-bound x)(upper-bound y)))
;        (upper (- (upper-bound x)(lower-bound y))))
;  (make-interval lower upper)))
;  
;  (width-interval (sub-interval x y))
; =(/ (- (upper-bound (sub-interval x y)) (lower-bound (sub-interval x y)))) 2)
; =(/ (- (- (upper-bound x)(lower-bound y)) (- (lower-bound x)(upper-bound y)))) 2)
; we know that (x - y) - (m - n) =  (x - m) - (y - n), so 
; =(/ (- (- (upper-bound x)(lower-bound x)) (- (lower-bound y) (upper-bound y)))) 2)
; =(/ (+ (- (upper-bound x)(lower-bound x)) (- (upper-bound y) (lower-bound y)))) 2)
; =(+ (width-interval x) (width-interval y))

; it turns out that the width of the difference of two intervals is also the sum of the widths of the intervals

; a helper function to compare two floating numbers with a fault tolerance of +-0.0000000001
(define (float-equal? a b)
  (or
   (and (> a b)(< (- a b) 0.0000000001))
   (and (< a b)(> (- a b) -0.0000000001))
   (equal? a b)))

;;testing
(newline)
(define i1 (make-interval 5.0 6.0))
(define i2 (make-interval 10.0 13.6))
(define res1 (width-interval (add-interval i1 i2)))
(define res2 (+ (width-interval i1) (width-interval i2)))
(float-equal? res1 res2)
(float-equal? (width-interval (sub-interval i1 i2)) res2)

(define i3 (make-interval -1.5 1.0))
(define i4 (make-interval 1.0 1.6))
(float-equal? (width-interval (add-interval i3 i4)) (+ (width-interval i3) (width-interval i4)))
(float-equal? (width-interval (sub-interval i3 i4)) (+ (width-interval i3) (width-interval i4)))

(define i5 (make-interval -1.5 1.0))
(define i6 (make-interval -3.0 1.6))
(float-equal?  (width-interval (add-interval i5 i6)) (+ (width-interval i5) (width-interval i6)))
(float-equal? (width-interval (sub-interval i5 i6)) (+ (width-interval i5) (width-interval i6)))

;; examples that this is not true for multiplication or division
(float-equal?  (width-interval (mul-interval i5 i6)) (+ (width-interval i5) (width-interval i6)))
(float-equal? (width-interval (div-interval i5 i6)) (+ (width-interval i5) (width-interval i6)))
(define i7 (make-interval -1.5 -1.0))
(define i8 (make-interval -3.0 -1.6))
(float-equal?  (width-interval (mul-interval i7 i8)) (+ (width-interval i7) (width-interval i8)))
(float-equal? (width-interval (div-interval i7 i8)) (+ (width-interval i7) (width-interval i8)))