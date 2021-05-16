#lang sicp

(#%require rackunit)

;(define (sqrt x)
;    (sqrt-iter 1.0 x)
;)

; вся программа sqrt может рассматриваться как пучок процедур, отражающий декомпозицию задачи
; процедура square процедурная абстракция

(define (square x) (* x x) )

; log логарифм
(define (square2 x)
    (define (double x) (+ x x) )
    (floor(exp(double (log x))))
)

; пользовать не должен знать как работает процедура, он просто должен ее использовать

(check-equal? (square 3) 9)
(check-equal? (square2 3) 9.0)

; результат процедуры не должен зависеть от имен формальных параметров, имена должны быть локальными в теле процедуры.

; блочная структура

; программа вычисления квадратного корня, именно она важна для пользователя
(define (sqrt x)
    (sqrt-iter 1.0 x)
)

; рекурсивная функция определения подкоренного числа
(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)
    )
)

; определяем приближение, если достаточно то заканчиваем процесс
(define (good-enough? guess x)
    (< (abs (- (square-int guess) x)) 0.001)
)

; вспомогательная процедура, квадрат числа
(define (square-int x) (* x x) )

; среднее значение от деления
(define (improve guess x)
    (average guess (/ x guess))
)

; среднее значение между двумя числами
(define (average x y)
    (/ (+ x y) 2)
)

; проблема в том, что имена average, square-int определены глобально, и их невозможно переопределить
; нужно спрятать эти процедуры внутри sqrt, можем переписать это следующим образом:

(define (sqrt2 x)
    (define (good-enough? guess x)
        (< (abs (- (square-int guess) x)) 0.001)
    )
    (define (square-int x) (* x x) )
    (define (improve guess x)
        (average guess (/ x guess))
    )
    (define (average x y)
        (/ (+ x y) 2)
    )
    (define (sqrt-iter guess x)
        (if (good-enough? guess x)
            guess
            (sqrt-iter (improve guess x) x)
        )
    )
    (sqrt-iter 1.0 x)
)
; такое вложение называют блочной структурой, упаковка имен в локальный скоуп, но наше еще можно упростить так
(define (sqrt3 x)

    (define (sqrt-iter guess x)
        (if (< (abs (- (* guess guess) x)) 0.001)
            guess
            (sqrt-iter
                (/ (+ guess (/ x guess)) 2)
                x)
        )
    )
    (sqrt-iter 1.0 x)
)

; мы оставили процедуру sqrt-iter и вызвали ее, читать программу стало сложнее, но тем самым мы показали как можно
; декомпозировать нашу программу


(check-equal? (sqrt 9) 3.00009155413138)
(check-equal? (sqrt2 9) 3.00009155413138)
(check-equal? (sqrt3 9) 3.00009155413138)