#lang scheme

(define (cube-iter guess x)
  (let ((newguess (improve guess x)))
  (if (good-enough? newguess guess x)
      guess
      (cube-iter newguess x))))

(define (good-enough? newguess oldguess x)
  (< (/ (abs (- oldguess newguess)) oldguess) 0.0000000000001))

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (cube x) (cube-iter 1.0 x))

;;tests
(- (expt (cube 27000000000000000000000000000000000000000000000) 3) 27000000000000000000000000000000000000000000000)
(- (expt (cube 27000000000000000000) 3) 27000000000000000000)
(- (expt (cube 0.000000000008) 3) 0.000000000008)