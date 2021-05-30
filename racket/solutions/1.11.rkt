#lang sicp

(#%require rackunit)

(define (rec n)
  (if (< n 3)
      n
      (+ (rec (- n 1))
         (rec (- n 2))
         (rec (- n 3))
      )
  )
)

(define (iter n)
  (f-iter 2 1 0 n)
)
(define (f-iter a b c count)
  (if (= count 0)
      c
      (f-iter (+ a b c) a b (- count 1))
  )
)

;http://sicp.sergeykhenkin.com/2007/08/20/sicp-exercise-solution-1-11/

(check-equal? (rec 10) 230)
(check-equal? (iter 10) 230)