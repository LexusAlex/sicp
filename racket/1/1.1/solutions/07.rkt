#lang sicp

(#%require rackunit)

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x) (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x))

  (define (better-good-enough? guess prev-guess)
    (< (abs (/ (- guess prev-guess) prev-guess)) 0.001))

  (define (better-sqrt-iter guess prev-guess x)
    (if (better-good-enough? guess prev-guess)
        guess
        (better-sqrt-iter (improve guess x)
                          guess
                          x)))

(define (better-sqrt x)
  (better-sqrt-iter 1.0 0.5 x))

(check-equal? (better-sqrt 4) 2.0000000929222947)
(check-equal? (better-sqrt 100) 10.000000000139897)
(check-equal? (better-sqrt 0.01) 0.10000000000139897)
(check-equal? (better-sqrt 0.0001) 0.010000000025490743)
(check-equal? (better-sqrt 0.000001) 0.0010000001533016628)
(check-equal? (better-sqrt 0.00000001) 0.00010000000000082464)
(check-equal? (better-sqrt 1000000000000000) 31622779.27999515)
