#lang scheme

;-------------------- VERSION 1 --------------
; state variable
(define balance 100)

(define (withdraw-unsafe amount)  ; unsafe because balance is globally accessible
  (if (>= balance amount)
      (begin (set! balance (- balance amount)) ; begin - expression 1
             balance) ; begin - expression 2
      "Insufficient funds"))

; SYNTAX of set!
;        (set! <name> <new-value>)
; SYNTAX of begin  -- with which more than one expressions can be evaluated together
;        (begin <exp1> <exp2> ... <expk>)
; <expk> will be returned as the value of the whole sequence. (same as OCaml sequence)


;-------------------- VERSION 2 ---------------
(define withdraw-safe   ; with balance being local to withdraw, any other procedures will not be able to access balance unless through here 
  (let ((balance 100))  ; use let to establish an environment with balance encapsulated within
    (lambda (amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          "Insufficient funds"))))


;-------------------- VERSION 3 ----------------
;; creating independent objects each with its own local state variable
(define (make-withdraw balance)
  (lambda (amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          "Insufficient funds")))

(define W1 (make-withdraw 100))
(define W2 (make-withdraw 100))