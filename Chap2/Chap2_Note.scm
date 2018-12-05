#lang scheme

;;2.1.1

(define x (cons 1 2));;

(define (make-rat n d) (cons n d))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
   (display (numer x))
   (display "/")
   (display (denom x))
   )

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y)(denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x)(numer y))
            (* (denom x)(denom y))))

(define (div-rat x y)
  (make-rat (* (numer x)(denom y))
            (* (denom x)(numer y))))

(define (equal-rat? x y)
  ( = (* (numer x) (denom y))
      (* (numer y) (denom x))))

;; TESTING:
(define one-half (make-rat 1 2))

(print-rat one-half)

(define one-third (make-rat 1 3))

(print-rat one-third)

(print-rat (add-rat one-third one-half)) ; 5/6

(print-rat (sub-rat one-half one-third)) ; 1/6 
(print-rat (sub-rat one-third one-half)) ; -1/6

(print-rat (mul-rat one-half one-third))
(print-rat (div-rat one-third one-half))



;; 2.1.3
;; implement cons, car, cdr w/o using any data structures at all but only using procedures

; using lambda here rather than the named function dispatch in the book. I think it's less confusing this way
(define (cons-alt x y)
  (lambda (m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (error "Argument not 0 or 1 --  CONS" m)))))      ; the result of (cons-alt x y) itself is a function that takes in an integer argument

(define (car-alt z) (z 0))
(define (cdr-alt z) (z 1))

;; validation:
(define z (cons-alt 10 20))
(newline)
(display (car-alt z))
(newline)
(display (cdr-alt z))




