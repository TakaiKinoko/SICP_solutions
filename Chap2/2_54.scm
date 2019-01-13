#lang scheme

(define (equal? la lb)
  (let ((notbase (and (pair? la) (pair? lb))))
    (cond ((not notbase) (if (eq? la lb) true false))
          (notbase (and (equal? (car la) (car lb)) (equal? (cdr la) (cdr lb))))
          (else false))))

; tests
(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))