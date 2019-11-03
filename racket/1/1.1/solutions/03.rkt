#lang sicp

(#%require rackunit)

; Разберем задачу, нужно вернуть сумму квадратов двух больших чисел из трех
; Воспользуемся уже определенными процедурами

(define (square x) (* x x) )

(define (sum-of-squares a b)
  (+ (square a) (square b))
)

; По логике нужно сравнить три числа и вычислить их сумму
; Больше решений данного упражнения http://sicp.sergeykhenkin.com/2007/08/14/sicp-exercise-solution-1-3/
(define (sum-of-biggest-squares a b c)
  (cond ((and (>= a c) (>= b c)) (sum-of-squares a b))
        ((and (>= a b) (>= c b)) (sum-of-squares a c))
        (else (sum-of-squares b c)))
)

(check-equal? (sum-of-biggest-squares 2 3 4) 25)
(check-equal? (sum-of-biggest-squares 10 3 5) 125)