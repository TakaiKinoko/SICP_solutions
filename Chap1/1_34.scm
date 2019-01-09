#lang scheme

; this file isn't runnable.

(define (f g) (g 2))

; equivalent to
(define f (lambda (g) (g 2)))

; use beta reduction on (f f) we have:  

(f (lambda (g)
       (g 2)))

((lambda (g)
     (g 2))
 (lambda (g)
     (g 2)))

((lambda (g)
    (g 2))
 2)

(2 2)

; apply an int to an int is wrong. 