#lang sicp

(#%require rackunit)

(define (A x y)
    (cond ((= y 0) 0)
          ((= x 0) (* 2 y))
          ((= y 1) 2)
          (else (A (- x 1)
                (A x (- y 1))
          ))
    )
)

(define (f n) (A 0 n)) ; => 2n
(define (g n) (A 1 n)) ; => 2^n
(define (h n) (A 2 n)) ; => 2^2^2^2... ((!)количество 2 равно n)
(define (k n) (* 5 n n)) ; => 5n^2

(check-equal? (A 1 10) 1024)
(check-equal? (A 2 4) 65536)
(check-equal? (A 3 3) 65536)
(check-equal? (f 3) 6)
(check-equal? (g 5) 32)
(check-equal? (h 4) 65536)
(check-equal? (k 2) 20)