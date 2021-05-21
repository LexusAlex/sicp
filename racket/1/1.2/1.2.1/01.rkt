#lang sicp

(#%require rackunit)

; факториал n! = n * (n - 1) * (n - 2) ... * 3 * 2 * 1
; 1! = 1
; 2! = 2 * 1 = 2
; 3! = 3 * 2 * 1 = 6

; линейно-рекурсивный процесс
(define (factorial n)
    (if (= n 1)
        1
        (* n (factorial (- n 1)))
    )
)

; данный процесс называется линейно рекурсивным , для наглядности рассмотрим ее работу подробнее
; 1. factorial 6
; 2. if (= 6 1) проверка на равенство, в данном случае не равно
; 3. factorial (- 6 1) уменьшаем значение n на 1
; 4. (* 6 (factorial (- 6 1)) - далее идем к шагу 2, до тех пор пока условие не совпадет
; процесс строит цепочку отложенных операций, сначала расширение, а затем сжатие. Сжатие происходит тогда когда выполняется цепочка отложенных операций.
; Это называется линейно рекурсивным процессом. При таком процессе интерпретатор должен помнить все операции отложенных вызовов. Рост операций происходит линейно.


; линейно итеративный процесс
(define (factorial2 n)
    (define (iter product counter)
        (if (> counter n)
            product
            (iter (* counter product)
                (+ counter 1)
            )
        )
    )
    (iter 1 1)
)
; еще вариант
(define (factorial3 n)
    (fact-iter 1 1 n)
)

(define (fact-iter product counter max-count)
    (if (> counter max-count)
        product
        (fact-iter (* counter product) (+ counter 1) max-count)
    )
)

; просто итеративный процесс-цикл
(define (test-iter i)
    (define (iter i counter)
        (if (>= counter i)
            counter
            (iter i (+ counter 1)
            )
        )
    )
    (iter 100 i)
)

; в обратную сторону
(define (test-iter-min i)
    (define (iter i counter)
        (if (<= counter i)
            counter
            (iter i (- counter 1)
            )
        )
    )
    (iter 10 i)
)


; Здесь ситуация обратная, на каждом шаге необходимо помнить текущее состояние переменных - этот процесс называется итеративным.
; При выполнении процесса задается конечное число переменных состояния, и правила изменения этих состояний
; число шагов растет с ростом n



(check-equal? (factorial 1) 1)
(check-equal? (factorial 6) 720)
(check-equal? (factorial2 1) 1)
(check-equal? (factorial2 6) 720)
(check-equal? (factorial3 1) 1)
(check-equal? (factorial3 6) 720)
(check-equal? (test-iter 1) 100)
(check-equal? (test-iter-min 0) 0)