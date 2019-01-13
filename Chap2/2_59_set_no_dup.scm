#lang scheme

; define sets by defining operations on sets
; union-set
; intersection-set
; element-of-set?
; adjoin-set

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((eq? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2))'())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((element-of-set? (car set1) set2) (union-set (cdr set1) set2))
        (else (union-set (cdr set1) (cons (car set1) set2)))))

; test
(define s1 (list 1 2 3 4 5 6 7))
(define s2 (list 6 7 8 9 10))
(element-of-set? 4 s1)
(adjoin-set 8 s1)
(intersection-set s1 s2)
(union-set s1 s2)