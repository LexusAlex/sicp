#lang sicp

(#%require rackunit)

; декларативное знание - что такое
; императивное знание - как

; x такое y, что y >= 0 и y2 = x

; квадрат числа
(define (square x) (* x x) )

; среднее значение между двумя числами
(define (average x y)
    (/ (+ x y) 2)
)

; улучшение
(define (improve guess x)
    (average guess (/ x guess))
)

; abs - модуль числа - встроенная процедура в язык
; good-enough? - ? - это обычный символ
(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001)
)

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)
    )
)

(define (sqrt x)
    (sqrt-iter 1.0 x)
)


(check-equal? (sqrt 9) 3.00009155413138)
(check-equal? (sqrt 4) 2.0000000929222947)
(check-equal? (sqrt 137) 11.704699917758145)