#lang sicp

(#%require rackunit)

(define (square x) (* x x))

(define (improve guess x)
  (/
    (+
      (/ x (square guess))
      (* guess 2))
    3))

(define (cube-root-iter guess x)
  (if (in-delta? guess (improve guess x))
      guess
      (begin
        (display guess)
        (newline)
        (cube-root-iter (improve guess x) x))))

(define (in-delta? guess1 guess2)
  (< (abs (- guess1 guess2)) 0.001))

(define (cube-root x)
  (cube-root-iter 1.0 x))

; (display guess) - вывести на экран
(cube-root 16)