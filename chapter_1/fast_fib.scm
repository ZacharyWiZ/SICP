#lang racket

(define (fib n) 
  (fib-iter 1 0 0 1 n)
  );fib

(define (fib-iter a b p q count)
  (cond ((= count 0) b);0
	((even? count)
	 (fib-iter a
		   b
		   (+ (* p p) (* q q))
		   (+ (* q q) (* 2 p q))
		   (/ count 2)));even?
	(else (fib-iter (+ (* b q) (* a q) (* a p) );+
			(+ (* b p) (* a q) );+
	                p
			q
			(- count 1))
	 );else
   );cond  
 );fib-iter

(define (even? n) 
  (= (remainder n 2)
     0)
  );even?

(fib 1)
(fib 2)
(fib 3)
(fib 4)
(fib 5)
(fib 6)
(fib 7)
(fib 8)
