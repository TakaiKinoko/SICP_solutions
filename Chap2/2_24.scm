#lang scheme

(list 1 (list 2 (list 3 4)))

; tree structure:
;      (1 (2 (3 4)))
;         /    \
;        1     (2 (3 4))
;              / \
;             2  (3 4)
;                / \
;               3   4