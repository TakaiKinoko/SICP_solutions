#lang scheme

; original implementation
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (expt (car things) 2)
                    answer))))
  (iter items '()))

; fixed
(define (square-list-fixed items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (append answer
                      (list (expt (car things) 2))))))
  (iter items '()))


; test
(square-list (list 1 2 3 4))
(square-list-fixed (list 1 2 3 4))