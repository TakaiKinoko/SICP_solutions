#lang scheme

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1 (intersection-set (cdr set1) (cdr set2))))
              ((< x1 x2)
               (intersection-set (cdr set1) set2))
              ((< x2 x1)
               (intersection-set set1 (cdr set2)))))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< x (car set)) (cons x set))
        ((= x (car set)) set)
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (union-set s1 s2)
  (if (or (null? s1) (null? s2))
       '()
        (let ((h1 (car s1)) (h2 (car s2)) (tl1 (cdr s1)) (tl2 (cdr s2)))
            (cond ((= h1 h2)
                   (cons h1 (union-set tl1 tl2)))
                  ((< h1 h2)
                   (union-set tl1 s2))
                  ((> h1 h2)
                   (union-set s1 tl2))))))



; tests
(define s1 (list 1 2 3 4 5))
(define s2 (list 3 4 5 6 7))
(element-of-set? 5 s1)
(intersection-set s1 s2)
(adjoin-set 2 s2)
(adjoin-set 9 s1)
(union-set s1 s2)