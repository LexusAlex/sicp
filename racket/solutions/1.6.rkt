#lang sicp

(#%require rackunit)

; новая версия if

(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
        (else else-clause)
    )
)

; при переписывании процедуры для вычисления корней методом Ньютона, процедура зациклиться
; объяснение http://sicp.sergeykhenkin.com/2007/08/15/sicp-exercise-solution-1-6/
(check-equal? (new-if (= 3 4) 0 7) 7)
(check-equal? (new-if (= 8 8) 5 16) 5)