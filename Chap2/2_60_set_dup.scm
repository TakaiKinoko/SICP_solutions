#lang scheme

; sets that allow duplicates are very suitable for databases that takes in lots of input but less queries
; e.g. transplant a social security database to a new system -- suitable because the social security base should have already eliminated duplicats
; O(n)
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

; O(1) insertion
(define (adjoin-set x set) (cons x set))

; O(1) union
(define (union-set set1 set2) (append set1 set2))

; O(n^3) intersection
(define (intersection-set set1 set2)
  (define (comp s1 s2 accum)
    (cond ((null? s1) accum)
          ((and (element-of-set? (car s1) s2) (not (element-of-set? (car s1) accum)))
           (comp (cdr s1) s2 (cons (car s1) accum)))
          (else (comp (cdr s1) s2 accum))))
  (comp set1 set2 '()))     ; don't forget to parenthesize (comp set1 set2 '())

; test
(define s1 (list 1 2 1 4 5 7 7 9 4))
(define s2 (list 1 2 5 5 8 8 5))
(element-of-set? 1 s1)
(union-set s1 s2)
(intersection-set s1 s2)