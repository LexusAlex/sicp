#lang sicp

(#%require rackunit)

(define a 3)
(define b (+ a 1))

(define (solution1 value)

    (cond
        ( (= value 1) 10 )
        ( (= value 2) (+ 5 3 4) )
        ( (= value 3) (- 9 1) )
        ( (= value 4) (/ 6 2) )
        ( (= value 5) (+ (* 2 4) (- 4 6) ) )
        ( (= value 6) a )
        ( (= value 7) b )
        ( (= value 8) (+ a b (* a b)) )
        ( (= value 9) (= a b) )
        ( (= value 10) (
            if (and (> b a) (< b (* a b)))
            b
            a
        ) )
        ( (= value 11)
        ( cond ((= a 4) 6)
               ((= b 4) (+ 6 7 a))
               (else 25)
        ) )
        ( (= value 12)
            (+ 2 (if (> b a) b a))
        )
        ( (= value 13)
            (* (
                cond ((> a b) a)
                     ((< a b) b)
                     (else -1))
            (+ a 1)
            )
        )

    )
)


(check-equal? (solution1 1) 10)
(check-equal? (solution1 2) 12)
(check-equal? (solution1 3) 8)
(check-equal? (solution1 4) 3)
(check-equal? (solution1 5) 6)
(check-equal? (solution1 6) 3)
(check-equal? (solution1 7) 4)
(check-equal? (solution1 8) 19)
(check-equal? (solution1 9) #f)
(check-equal? (solution1 10) 4)
(check-equal? (solution1 11) 16)
(check-equal? (solution1 12) 6)
(check-equal? (solution1 13) 16)