#lang scheme

(define (square-list items)
  (if (null? items)
      '()
      (cons (expt (car items) 2) (square-list (cdr items)))))

(define (square-list-alt items)
  (map (lambda (x) (* x x)) items))

;test
(square-list (list 1 2 3 4))
(square-list-alt (list 1 2 3 4))