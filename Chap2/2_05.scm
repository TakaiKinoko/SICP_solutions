#lang scheme

; examples:
; 40 = 2^3 * 5 = 2^3 * (2 + 3) = 2^3 * (2^1*3^0 + 2^0*3^1)  
; 16 = 2^3 * 3^0
;  9 = 2^3 * 3^0 + 2^0 * 3^0  =  2^0 * 3^2            

; level 1 -- I think is that any nonnegative integer can be represented as an int-pair defined below

; level 2 -- constructor for nonnegative integer pairs
(define (int-pair a1 b1 a2 b2) (cons (cons-alt a1 b1) (cons-alt a2 b2)))

; level 3
; constructor -- use cons to represent nonnegative integers as the product of 2^a*3^b
(define (cons-alt a b) (* (expt 2 a) (expt 3 b)))

; selector -- get the exponents
(define (car-alt i)
  (cond ((< i 2) 0)
        ((equal? (modulo i 2) 0) (+ 1 (car-alt (/ i 2))))
        (0)))

(define (cdr-alt i)
  (cond ((< i 3) 0)
        ((equal? (modulo i 3) 0) (+ 1 (cdr-alt (/ i 3))))
        (0)))

;; tests
(equal? 2 (car-alt (cons-alt 2 3)))
(equal? 3 (cdr-alt (cons-alt 2 3)))
(equal? 0 (car-alt (cons-alt 0 3)))
(equal? 0 (cdr-alt (cons-alt 4 0)))
(equal? 1000 (cdr-alt (cons-alt 2 1000)))
(equal? 999 (car-alt (cons-alt 999 1000)))