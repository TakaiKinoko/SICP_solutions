#lang scheme

; selectors
(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

; constructor
(define (make-tree entry left right) (list entry left right))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (entry set)) true) 
        ((< x (entry set))
         (element-of-set? x (left-branch set)))
        ((> x (entry set))
         (element-of-set? x (right-branch set)))))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((< x (entry set)) 
         (make-tree (entry set)
                    (adjoin-set x (left-branch set))
                    (right-branch set)))
        ((> x (entry set))
         (make-tree (entry set) (left-branch set) (adjoin-set x (right-branch set))))))

; tests
(define t (make-tree 5 '() '()))
(element-of-set? 1 t)
(define new_t (adjoin-set 1 (adjoin-set 2 (adjoin-set 3 (adjoin-set 4 (adjoin-set 5 (adjoin-set 6 (adjoin-set 7 t))))))))
(display t)
(newline)
(display new_t)
(left-branch new_t)

; convert a BST to a list
(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

; test
(display (tree->list-1 new_t))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

; test
(display (tree->list-2 new_t))

; a. same in-order tree traversal
; b. the second one is tail recursive, so has O(1) in terms of space whereas the first algorithm takes O(n) space