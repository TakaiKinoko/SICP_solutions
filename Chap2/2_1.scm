#lang scheme

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))


(define (make-rat n d)
  (let ((g (gcd n d)) (bool1 (and (positive? n) (positive? d))) (bool2 (and (negative? n) (negative? d))))
  (if (or bool1 bool2 )
      (cons (abs (/ n g)) (abs (/ d g)))
      (cons  (- 0 (abs (/ n g))) (abs (/ d g))))))


;; tests
(make-rat 3 9)
(make-rat -5 9)
(make-rat -6 -9)
(make-rat 3 -9)