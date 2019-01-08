#lang scheme

(define (for-each func items)
  (if (null? items)
      (newline)
      (let ((side-effect (func (car items))))
        (for-each func (cdr items)))))

; why doesn't this one work?
(define (for-each-alt func items)
  (if (null? items)
      (newline) 
      ((func (car items)) (for-each-alt func (cdr items)))))

;test
(for-each (lambda (x) (newline) (display x))
          (list 1 2 3))

(for-each-alt (lambda (x) (newline) (display x))
          (list 1 2 3))