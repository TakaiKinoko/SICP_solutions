#lang scheme

; example code given on P109 
(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

; test
(define x (cons (list 1 2) (list 3 4)))
(count-leaves x)
(length x)