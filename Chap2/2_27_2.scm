#lang scheme

(define (deep-reverse tree)
    (cond ((null? tree)         
            '())
          ((not (pair? tree))   
            tree)
          (else
            (reverse (list (deep-reverse (car tree))            
                           (deep-reverse (cadr tree)))))))