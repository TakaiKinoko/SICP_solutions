#lang scheme

; define map
;(define (map op sequence)
;  (cond ((null? sequence) '())
;        ((not (pair? sequence)) (op sequence))
;        (cons (map op (car sequence))
;              (map op (cdr sequence))))

(define (map op sequence)
  (if (null? sequence)
      '()
      (cons (op (car sequence))
            (map op (cdr sequence)))))

; test map
(map (lambda (x) (* x x)) (list 1 2 3 4 5))

; define filter
(define (filter predicate sequence)
  (cond ((null? sequence) '())
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

; test filter
(filter odd? (list 1 2 3 4 5))

; define accumulator
(define (accumulate op init sequence)
  (if (null? sequence)
      init
      (op (car sequence)
          (accumulate op init (cdr sequence)))))   ; not tail recursive

; test accumulator
(accumulate + 0 (list 1 2 3 4 5))
(accumulate * 1 (list 1 2 3 4 5))
(accumulate cons '() (list 1 2 3 4 5))

; define enumerator for ints 
(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

; test enumerator
(enumerate-interval 2 7)

; define enumerator for trees
(define (enumerate-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

; test enumerator
(enumerate-tree (list 1 (list 2 (list 3 4)) 5))

; reformulate sum-odd-squares as in the signal-flow diagram
(define (sum-odd-squares tree)
  (accumulate +
               0
               (map (lambda (x) (* x x))
                    (filter odd?
                            (enumerate-tree tree)))))

; test sum-odd-squares
(sum-odd-squares (list 1 (list 2 (list 3 4) 5) (list 6 7)))