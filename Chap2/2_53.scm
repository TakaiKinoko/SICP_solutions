#lang scheme

(define (memq item x)
  (cond ((null? x) false)
        ((eq? (car x) item) x)    ; return the sublist of the list beginning with the item
        (else (memq item (cdr x)))))

; test
(memq 'apple '(pear banana prune))
(memq 'apple '(x (apple sauce) y apple pear))

(list 'a 'b 'c)
(list (list 'george))
(cdr '((x1 x2) (y1 y2)))
(cadr '((x1 x2) (y1 y2)))
(pair? (car '(a short list)))
(memq 'red '((red shoes) (blue socks)))
(memq 'red '(red shoes blue socks))