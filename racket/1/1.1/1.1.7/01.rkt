#lang sicp

(#%require rackunit)

; декларативное знание - что такое
; императивное знание - как

; x такое y, что y >= 0 и y2 = x

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)
    )
)