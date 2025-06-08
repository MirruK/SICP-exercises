(define add1
  (lambda (x)
    (+ x 1)))

(define
  (sub1 x)
  (- x 1))

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


(define (facc acc n) 
  (cond ((= n 1) acc)
         (#t (facc (* acc n) (- n 1)))
  )
)

(define (fac n) (facc 1 n))

(display (fac 6))
(newline)


(display (+ 3 5 6))
(newline)

(display (/ 12847 123))
(newline)



