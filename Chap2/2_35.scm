#lang scheme

(define (accumulate op init sequence)
  (if (null? sequence)
      init
      (op (car sequence)
          (accumulate op init (cdr sequence)))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x)
                     (cond ((null? x) 0)
                           ((not (pair? x)) 1)
                           (else (+ (count-leaves (car x)) (count-leaves (cdr x)))))) t)))  

; test
(count-leaves (list (list 1 2) 3 4))