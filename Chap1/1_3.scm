#lang scheme

; gosh there must be a less verbose way to do this...
(define (max-trio a b c)
  (let ((square (lambda (x) (* x x))))
  (cond ((or (= a b)(< a b)) (if (or (= c a) (> c a)) (+ (square c) (square b)) (+ (square a) (square b))))
        ((> a b) (if (or (= c b)(> c b)) (+ (square c) (square a)) (+ (square b) (square a)))))))

;; tests
(equal? (+ (* 5 5) (* 6 6)) (max-trio 5 4 6))
(equal? (max-trio 6 5 4) (max-trio 4 5 6))
(equal? (max-trio 5 5 5) (max-trio 4 5 5))
(equal? (max-trio 5 5 4) (max-trio 5 4 5))