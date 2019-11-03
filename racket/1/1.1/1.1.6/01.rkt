#lang sicp

(#%require rackunit)

; Разбор случаев

; cond ( ( (предикат) (выражение - следствие)) - ветка
;        ( (предикат) (выражение - следствие))
; )

; #t true
; #f false
; (- x) смена знака
; Модуль числа
(define (abs x)
    (cond ((> x 0) x)
          ((= x 0) 0)
          ((< x 0) (- x))
    )
)

(define (abs2 x)
    ( cond ( (< x 0) (- x) )
           (else x)

))

(define (abs3 x)
    (if (< x 0)
        (- x)
        x
    )
)

; Просто пример использования условия cond
(define (test x)
    (cond ( (= x (+ 10 10)) 20 )
          ( (> x 5) 10)
          ( (< x 5) (+ 2 3))
    )
)

; Пример использования cond/else

(define (test2 x y)
    ( cond ( (> x 10) 40 )
           (else y)

))

; Пример использования if

(define (test3 x y)
    (if (= x 30)
        90
        y
    )
)

; Cond - последовательность выражений которые вычисляются по очереди, if - обязан состоять хотя бы из одного выражения

; Элеметарные предикаты < > =
; Операции логической композиции and or - особые формы not - обычная процедура
; and - выражения вычисляются слева направо, если выражение дает false, тогда остальные выражения не вичисляются, и значением всего выражения становится false
; если все выражения имеют значения true, тогда возвращается значение последнего из них
(define (test4 x)
    ( and (> x 10) (< x 20) (or (= 17) ) )
)

; Возвращется значение последнего из них - это 27
(define (test5 x)
    ( and 10 20 40 27)
)

; or - выражения вычиляются слева направо, если какое-нибудь выражение дает true, тогда результатом выражения значение, если все значения false, тогда результат всего выражения false

(define (test6 x)
    ( or 10 20 40 27)
)

(define (test7 x)
    ( or (= x 14) (< x 10) (< x 11) (< x 12))
)

; not - инвентирование значений

(define (test8 x)
    ( not (= x 12))
)

(check-equal? (abs 1) 1)
(check-equal? (abs 0) 0)
(check-equal? (abs -20) 20)

(check-equal? (abs2 1) 1)
(check-equal? (abs2 0) 0)
(check-equal? (abs2 -20) 20)

(check-equal? (abs3 1) 1)
(check-equal? (abs3 0) 0)
(check-equal? (abs3 -20) 20)

(check-equal? (test 7) 10)
(check-equal? (test 2) 5)
(check-equal? (test 20) 20)

(check-equal? (test2 7 10) 10)
(check-equal? (test2 20 6) 40)

(check-equal? (test3 30 2) 90)
(check-equal? (test3 11 6) 6)

(check-equal? (test4 17) #t )
(check-equal? (test4 28) #f )

(check-equal? (test5 28) 27 )

(check-equal? (test6 28) 10 )
(check-equal? (test7 28) #f )

(check-equal? (test8 28) #t )