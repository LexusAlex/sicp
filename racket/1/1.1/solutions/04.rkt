#lang sicp

(#%require rackunit)

; Как работает данная процедура
; Важный момент - операции + - являются такими же членами языка, что видно из данного примера
(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b)
)
(check-equal? (a-plus-abs-b 3 4) 7)
(check-equal? (a-plus-abs-b 3 0) 3)
(check-equal? (a-plus-abs-b 3 -5) 8)