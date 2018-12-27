#lang scheme

;;level 3 - representing points as pairs
(define make-point cons)
(define x-point car)
(define y-point cdr)

;;level 2 - representing segments as pairs of points
(define (make-segment x1 y1 x2 y2) (cons (make-point x1 y1) (make-point x2 y2)))
(define start-segment car)
(define end-segment cdr)

;;level 1 - operations on segments
(define (midpoint-segment seg)
  (let ((p1 (start-segment seg)) (p2 (end-segment seg)) (get-mid (lambda (x y) (/ (+ x y) 2))))
  (make-point (get-mid (x-point p1)(x-point p2)) (get-mid (y-point p1)(y-point p2)))))

(provide (all-defined-out)) ; so that everything defined here can be accessed by other files requiring it

;; tests
(define seg1 (make-segment 1.0 0.0 2.0 3.0))
(equal? (start-segment seg1) (make-point 1.0 0.0))
(equal? (x-point (start-segment seg1)) 1.0)
(equal? (end-segment seg1) (make-point 2.0 3.0))
(equal? (midpoint-segment seg1) (make-point 1.5 1.5))
