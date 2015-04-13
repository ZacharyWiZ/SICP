#lang racket

(define (fast-expt b n)
  (cc b 1 n)
  );define

(define (cc b a n)
  (cond ((= n 0) a);0
	((= n 1) (* b a))
	((even? n) (cc (square b) (square a) (/ n 2));cc
	 );1
	(else (* b (cc b a (- n 1))
		  );*
	       );else
   );cond
  );define 


(define (cc-new b a n)
  (cond ((= n 0) 
	  a);0
	((even? n)
	  (cc-new (square b)
		   a
		   (/ n 2)));even
	(else
	  (cc-new b
		  (* b a)
		  (- n 1)));else
	);cond
  );define

(define (fast-expt-new b n)
  (cc-new b 1 n)
  );define

(define (even? n)
  (= (remainder n 2) 0);=
  );define

(define (square x)
  (* x x))

(fast-expt-new 2 1)
(fast-expt-new 2 2)
(fast-expt-new 2 3)
(fast-expt-new 2 4)
(fast-expt-new 2 5)
(fast-expt-new 2 6)
(fast-expt-new 2 7)
(fast-expt-new 2 10)
