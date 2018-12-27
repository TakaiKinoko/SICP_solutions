#lang scheme

; redefine div-interval so that it signals an error when the denominator is an interval that spans zero 
(define (div-interval x y)
  (if (and (< (lower-bound y) 0) (> (higher-bound y) 0))
      "illegal denominator"
       (mul-interval x (make-interval (/ 1.0 (upper-bound y)) 
                                  (/ 1.0 (lower-bound y)))))) 

