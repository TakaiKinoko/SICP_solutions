#lang scheme

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

; constructor
(define (make-sum a1 a2) (list '+ a1 a2))    ; parenthesized prefix notation 

; constructor
(define (make-product m1 m2) (list '* m1 m2))

; a sum is a list whose first element is the symbol +
(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

; the addend is the second item of the sum list
; selector
(define (addend s) (cadr s))

; the augend is the third item of the sum list
; selector
(define (augend s) (caddr s))

; similar to the sum func and its following
(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

; selector
(define (multiplier p) (cadr p))

; selector
(define (multiplicand p) (caddr p))

;combine the above into the differentiation program
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum (make-product (multiplier exp) (deriv (multiplicand exp) var))
                   (make-product (multiplicand exp) (deriv (multiplier exp) var))))
        (else
         (error "unknown expression type -- DERIV" exp))))


; test
(deriv '(+ x 3) 'x)
(deriv '(* x y) 'x)
(deriv '(* (* x y) (+ x 3)) 'x)