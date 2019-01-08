#lang scheme

; deep reverse
(define (deep-reverse lst)
    (define (iter remained-items result)
        (if (null? remained-items)
            result
            (iter (cdr remained-items)
                  (cons (if (pair? (car remained-items))
                            (deep-reverse (car remained-items))
                            (car remained-items))
                        result))))
    (iter lst '()))

; test
(define x (list (list 1 2) (list 3 4)))
(deep-reverse x) 