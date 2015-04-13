#lang racket

(define (count-change amount)
  (cc amount 5); 5 means there has five kinds of change a dollar )
);define
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
	((or (< amount 0)
	     (= kinds-of-coins 0));or
	 0)
	(else (+ (cc amount 
		     (- kinds-of-coins 1));cc
		 (cc (- amount
			(first-denomination kinds-of-coins) );-
		     kinds-of-coins)
	       );+
	      );else
   
   );cond
  );define


(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
	((= kinds-of-coins 2) 5)
	((= kinds-of-coins 3) 10)
	((= kinds-of-coins 4) 25)
	((= kinds-of-coins 5) 50)
	);cond
);define

(count-change 100)
