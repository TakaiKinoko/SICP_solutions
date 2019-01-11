#lang scheme

; accumulate (non-tail-rec)
(define (accumulate op init sequence)
  (if (null? sequence)
      init
      (op (car sequence)
            (accumulate op init (cdr sequence)))))

; accumulate (tail-rec)
(define (accumulate-tail op init sequence)
  (define (aux func accum items)
    (if (null? items)
        accum
        (aux func (func accum (car items)) (cdr items))))
  aux op init sequence)

; test accumulate-tail
(accumulate-tail + 0 (list 1 2 3 4 5))
(accumulate + 0 (list 1 2 3 4 5))

(define (aux op accum items)
    (if (null? items)
        accum
        (aux op (op accum (car items)) (cdr items))))

(aux + 0 (list 1 2 3 4 5))

; define map using accumulate

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))
; test
(map (lambda (x) (* x x)) (list 1 2 3 4 5))

; define append using accumulate
(define (append seq1 seq2)
  (accumulate cons seq2 seq1))
; test
(append (list 1 2 3) (list 4 5 6))

; define length using accumulate
(define (length sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))
; test
(length (list 1 2 3 4 5))