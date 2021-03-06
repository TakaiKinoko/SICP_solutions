#lang scheme

(define (tree-map func tree)
  (map (lambda (x)
         (if (pair? x)
             (tree-map func x)
             (func x)))
       tree))

(define (square x) (* x x))

(define (square-tree tree) (tree-map square tree))

; test
(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))