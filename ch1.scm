(define-syntax-rule (eval+show expr)
                    (begin
                     (format #t "⇒ ~a\n" expr)
                     expr))
; Exercise 1-2
(eval+show (/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7))))
; Exercise 1-3

(define (square a)
    (* a a))
(define (larger-sum-of-sq x y z)
 (cond
  ((> x y)
   (if (> y z)
    (+ (square x) (square y))
    (+ (square x) (square z))))
  (#t
   (if (> x z)
    (+ (square x) (square y))
    (+ (square y) (square z))))))

(eval+show (larger-sum-of-sq 1 2 3))
(eval+show (larger-sum-of-sq 3 2 1))
; 1-4
(define (a-plus-abs-b a b)
 ; The function to be used on a and b is decided by the predicate
 ((if (> b 0)
   +
   -)
  a
  b))


; 1-5
(define (p)
 (p))

(define (test x y)
 (if (= x 0)
  0
  y))

; Will cause infinite loop if normal-order
; With applicative order the function call will be replaced
; With the body and p will never be called, because it short
; circuits after the predicate is #t
; (test 0 (p))
;

; 1-6
; The custom if function will cause an infinite loop
; due to normal-order of application. The arguments passed
; to the if function will be evaluated first, leading to the
; function recursing infinitely
;

; 1-7
; Rewrite this to work with larger numbers
(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))

; The improved version takes the
; ratio of the squared guess and original number
(define (good-enough2? guess x)
    (let ((sq (square guess)))
        (< 0.9999
           (if (> sq x) (/ x sq) (/ sq x))
        )
    )
)

(define (sqrt-iter guess x)
    (if (good-enough2? guess x)
        guess
        (sqrt-iter (improve guess x) x)))

(define (improve guess x)
    (average guess (/ x guess)))

(define (improve-cbrt y x)
    (/ (+ (/ x (square y)) (* 2 y))
       3)
)

(define (average x y)
    (/ (+ x y) 2))

; 1-8 TODO
; (define (cbrt x) (
;     (cbrt-iter 1 x)
;     (define (cbrt-iter guess x)
;         (if (good-enough2 guess x) guess
;             (cbrt-iter (improve-cbrt guess x) x ))
;     )
;     )
; )

(eval+show (sqrt-iter 1 0.025))

; (define (+ a b)
;     (if (= a 0) b (inc (+ (dec a) b))))
; inc (+ 4 5) |---->|
; inc (+ 3 5) |--->||
; inc (+ 2 5) |-->|||
; inc (+ 1 5) |->||||
; inc (+ 0 5) |>|||||
; 5           |||||||
; inc 5 => 6 <-||||||
; inc 6 => 7 <--|||||
; inc 7 => 8 <---||||
; inc 8 => 9 == 4 + 5
;  
; (define (+ a b)
;     (if (= a 0) b (+ (dec a) (inc b))))


(define (fib n)
    (if (< n 1) 1 (+ (fib (- n 1)) (fib (- n 2 )))
    )
)

; (eval+show (fib 5))
; fib 5 -> fib 4 
; fib 4 -> fib 3
; ... fib 1 = 1
;  --> fib 2 = (+ 1 (fib 0)) --> + 1 1 = 2
;  --> fib 3 = (+ 2 (fib 1)) --> + 2 1 = 3
;  --> fib 4 = (+ 3 (fib 2)) --> recalc fib 2
;  --> fib 4 = (+ 3 2) = 5
;  --> fib 5 = (+ 5 (fib 3)) --> recalc fib 3
;  --> fib 5 = (+ 5 3) = 8 [x]

(define (fib-iter curr acc n)
        (if (= n 0) acc (fib-iter acc (+ acc curr) (- n 1)))
)

; (eval+show (fib-iter 0 1 130))

; (eval+show (* 21.21 (+ 6 (/ 3 4))))

; 0.01, 0.10, 0.25, 0.5 -- 1$ --> (0.5) (0.5) -> (0.25) (0.25) (0.5) | 
;
; (define coin-types '(0.01 0.05 0.1 0.25 0.5))
; (define (coins n) ())
;
; 1-9 TODO
; 
; 1-10 TODO
; 
; 1-11 recursive
(define (v n) (if (< n 3) n (+ (v (- n 1)) (* 2 (v (- n 2))) (* 3 (v (- n 3))))))

; (eval+show (v 15))
; 142717

; 1-11 iterative ---------------
(define (v-iter f s acc n)
    (cond ((and (< n 3) (= f 0)) n)
        ((< n 3) acc)
        (else (v-iter s acc (+ (* f 3) (* s 2) acc) (- n 1)))
    ))

(define (v-iter-wrap n) (v-iter 0 1 2 n))

; (eval+show (v-iter-wrap 15))
; 142717

; 1-11 iterative END -----------

