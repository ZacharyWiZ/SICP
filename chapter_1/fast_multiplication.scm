#lang racket

(define (fast-multiplication a b n);a*n
  (cond ((= n 0) b);n==0
	((even? n)
	 (fast-multiplication (double a)
			      b
			      (halve n)));even? n
	(else
	 (fast-multiplication a
			      (+ a b)
			      (- n 1))
	 );else

	);cond
  );fast-multiplication  it's iteration

(define (fast-multiplication-new a n)
  (cond ((= n 0) 0)
	((= n 1) a)
	((even? n) (double (fast-multiplication-new a
					    (halve n))))
   
	(else (a +
		 (fast-multiplication-new a 
					  (- n 1)))
	 );else
   );cond
  );fast-multiplication-new it's recursive

(define (double x)
  (+ x x));double

(define (halve x)
  (/ x
     2)
  );halve

(define (even? x)
  (= (remainder x 
		2)
    0);=
  );even


(fast-multiplication-new 8 0 1)
(fast-multiplication-new 8 0 2)
(fast-multiplication-new 8 0 3)
(fast-multiplication-new 8 0 4)
(fast-multiplication-new 8 0 9)
