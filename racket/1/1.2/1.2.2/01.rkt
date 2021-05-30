#lang sicp

(#%require rackunit)

; Число фибоначчи, сумма чисел двух других предыдущих

(define (fib n)
    (cond ((= n 0) 0)
          ((= n 1) 1)
          (else (+ (fib (- n 1)) (fib (- n 2))))
    )
)

; (fib 5)
; (+ fib(4) fib(3))
; (+ fib(fib(3)) fib(fib(2)))
; ..
;(fib 3)
; число шагов при таком вычислении растет экспоненциально, производит массу ненужных вычислений.
; в таком виде ее лучше не использовать, гораздо лучше для этих целей использовать итеративный процесс

(define (fib-i n)
    (fib-iter 1 0 n))

(define (fib-iter a b count)
    (if (= count 0)
        b
        (fib-iter (+ a b) a (- count 1))
    )
)

; при таком вычислении мы начинаем с a = 0, b = 1, count = 3, и на каждом шаге складываем a+b, и уменьшаем счетчик
; таким образом мы определили три переменные состояния
(check-equal? (fib-i 3) 2)

; размен денег
; задача разменять сумму в 1 доллар, монетами 50, 25, 10, 5, 1 цент, сколько способами можно это сделать
; рассмотрим подробнее процедуру

(define (count-change amount)

    (define (cc amount kinds-of-coins)
        (cond ((= amount 0) 1)
              ((or (< amount 0) (= kinds-of-coins 0)) 0)
              (else (+
                        (cc amount (- kinds-of-coins 1))
                        (cc (- amount (first-denomination kinds-of-coins)) kinds-of-coins)
                    )
              )
        )
    )
    (cc amount 5)
)


(define (first-denomination kinds-of-coins)
    (cond ((= kinds-of-coins 1) 1)
          ((= kinds-of-coins 2) 5)
          ((= kinds-of-coins 3) 10)
          ((= kinds-of-coins 4) 25)
          ((= kinds-of-coins 5) 50)
    )
)

(check-equal? (count-change 100) 292)
