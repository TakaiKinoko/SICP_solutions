#lang scheme
;(require scheme/include)
(require "2_2.scm") ; where the line-segment is defined

;; level 1 (highest) -- operations on rectangles (or one can say: selectors of a rectangle's property)

(define (perimeter rec)
  (* 2 (+ (length (bottom-edge rec)) (length (left-edge rec)))))

(define (area rec)
  (* (length (bottom-edge rec)) (length (left-edge rec))))

;; level 2 -- constructor and selectors for rectangle
(define (make-rectangle bottom left) (cons bottom left)) ; rectangle is defined as a pair of line-segments

(define bottom-edge car)

(define left-edge cdr)

;; level 3 -- operations on line-segments  (in 2.2 only midpoint-segment is defined)
(define (length seg)
  (let ((p1 (start-segment seg)) (p2 (end-segment seg)))
    (sqrt ( + (expt ( - (x-point p1) (x-point p2)) 2) (expt ( - (y-point p1)(y-point p2)) 2)))))

;; tests
(define rec1 (make-rectangle (make-segment 1.0 0.0 5.0 0.0)(make-segment 1.0 0.0 1.0 3.0)))
(equal? 14.0 (perimeter rec1))
(equal? 12.0 (area rec1)) 

;; level 1 (highest) -- implementation unchanged, names of the functions adjusted to accommodate the new implementation of lower levels

(define (perimeter-alt rec)
  (* 2 (+ (length (bottom-edge-alt rec)) (length (left-edge-alt rec)))))

(define (area-alt rec)
  (* (length (bottom-edge-alt rec)) (length (left-edge-alt rec))))

;; redefining level 2
(define (make-rectangle-alt low-left-pt top-right-pt) (cons low-left-pt top-right-pt)) ; rectangle defined as a pair of points
(define (bottom-edge-alt rec) (make-segment (x-point (low-left-pt rec)) (y-point (low-left-pt rec)) (x-point (top-right-pt rec)) (y-point (low-left-pt rec))))
(define (left-edge-alt rec) (make-segment (x-point (low-left-pt rec)) (y-point (low-left-pt rec)) (x-point (low-left-pt rec)) (y-point (top-right-pt rec)))) 
(define low-left-pt car)
(define top-right-pt cdr)

;; tests
(define rec2 (make-rectangle-alt (make-point 1.0 0.0) (make-point 5.0 3.0)))
(equal? 14.0 (perimeter-alt rec2))
(equal? 12.0 (area-alt rec2)) 

