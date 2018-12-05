#lang scheme

(define (cons x y)
  (lambda (m) (m x y)))     ; the result of cons is the function λm.mxy

(define (car z)
  (z (lambda (p q) p)))     ; (λm.mxy)(λpq.p) --> (λpq.p)xy --> x

(define (cdr z)
  (z (lambda (p q) q)))

;; validation
(define z (cons 1 2))
(equal? 1 (car z))
(equal? 2 (cdr z))