#lang scheme

(define (reverse items)
  (define (aux acc lst)
    (if (null? lst)
        acc
        (aux (cons (car lst) acc) (cdr lst))))
  (aux '() items))

; test
(reverse (list 1 4 9 16 25))