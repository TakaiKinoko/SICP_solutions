#lang scheme

; direct implementation 
(define (square-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

; alternative using map and recursion
(define (square-tree-alt tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree-alt sub-tree)
             (* sub-tree sub-tree)))
       tree))


; test
(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))

(square-tree-alt
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))