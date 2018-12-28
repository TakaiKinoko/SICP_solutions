#lang scheme
; returns the list that contains only the last element of a givfen NONEMPTY list

; sol-1
(define (last-pair items)
  (define (aux i lst)
    (if (null? lst)
        (cons i '())
        (aux (car lst) (cdr lst))))
  (aux (car items) (cdr items)))

; test
(last-pair (list 23 72 149 34))

; sol-2
(define (last-pair-2 items)
  (if (= 1 (length items))
      items
      (last-pair-2 (cdr items))))

; test
(last-pair-2 (list 23 72 149 34))
