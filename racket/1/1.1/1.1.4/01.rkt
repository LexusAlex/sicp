#lang sicp

(#%require rackunit)

; Составная процедура возведение в квадрат
(define (square x) (* x x) )

(check-equal? (square 3) 9)
(check-equal? (square 21) 441)

; Форма определения процедуры (define (имя_процедуры параметры) (тело_процедуры))

; Можно использовать процедуру при определении других процедур тем самым комбинируя их как угодно

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(check-equal? (+ (square 2) (square 2)) 8)
(check-equal? (sum-of-squares 3 4) 25)