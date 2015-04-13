#lang racket


(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m));even?
	(else 
	 (remainder (* base (expmod base (- exp 1) m))
		    m));else
   );cond
  );expmod

(define (even? n)
  (= (remainder n 2)
     0);=
  );even?
(define (square n)
  (* n n)
  );square

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1))))
  )

(define (fast-prime? n times)
  (cond ((= times 0) true)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else false)
	);cond
  );fast-prime?

;(fermat-test 17)
;(fermat-test 15)
;(fermat-test 11)
(fast-prime? 17 10)
(fast-prime? 15 13)
(fast-prime? 11 9)
(fast-prime? 9 5)
