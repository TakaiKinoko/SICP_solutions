#lang scheme

; recursive

(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1)) (f (- n 2)) (f (- n 3))))))

; tests
(f 0)
(f 1)
(f 2)
(f 3)
(f 4)

; iterative
(define (f-iter n)
  (define (aux x y z counter)
    (cond ((< n 3) n)
          ((= counter n) (+ x y z))
          (else (aux y z (+ x y z) (+ counter 1)))))
  (aux 0 1 2 3))

; tests
(newline)
(f-iter 0)
(f-iter 1)
(f-iter 2)
(f-iter 3)
(f-iter 4)
(f-iter 100)

; should be suuuuper slow
(f 100)