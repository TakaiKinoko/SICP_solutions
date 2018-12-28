#lang scheme

; list operations
; 1. list-ref returns the nth element of a list
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

; 2. length of a list --  recursive
(define (length items)
  (if (null? items) 0 (+ (length (cdr items)) 1)))

; 3. length of a list -- iterative
(define (length-iter items)
  (define (aux a count)
    (if (null? a) count (aux (cdr a) (+ 1 count))))
  (aux items 0))

; 4. append
(define (append l1 l2)
  (if (null? l1)
      l2
      (cons (car l1) (append (cdr l1) l2))))
;test
(define l1 (list 1 2 3 4 5 6))
(define l2 (list 7 8 9))
(append l1 l2)