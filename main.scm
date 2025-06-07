(define add1
  (lambda (x)
    (+ x 1)))

(define sub1
  (lambda (x)
    (- x 1)))

(display (add1 5))
(newline)

(define add
  (lambda (x c)
          (if (eq? c 0) x (add (add1 x) (sub1 c)))))

(display (add 5 6))
(newline)

(display (pair? (list 1 2 3)))
(newline)

(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(display (atom? (quote ())))
(newline)

(define s '(banana and))
(define l '(peanut butter and jelly))
(define sp (list 'banana 'and))

; (define allatom?
;   (lambda (x)
;           (loop )))

; (display (cons sp l))
; (newline)

(display
  (+  (* 3
    (+  (* 2 4)
        (+ 3 5)))
  (+ (- 10 7)
    6)))
(newline)
