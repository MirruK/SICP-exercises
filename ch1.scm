(define-syntax-rule (eval+show expr)
                    (begin
                     (format #t "⇒ ~a\n" expr)
                     expr))
; Exercise 1-2
(eval+show (/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7))))
; Exercise 1-3
(define (larger-sum-of-sq x y z)
 (define (square a)
  (* a a))

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
