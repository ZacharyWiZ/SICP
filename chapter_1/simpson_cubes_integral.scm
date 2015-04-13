#lang racket

;this function is use recursive
(define (sum term a next b)
  (if (> a b) 
      0
      (+ (term a)
	 (sum term (next a) next b)
	 );+
   );if
  );sum

;this function is use Iteration
(define (sum-iteration term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a)
	      (+ result 
		 (term a )))
     );if
    )
  (iter a 0)
  );sum-iteration

(define (even? n)
  (= (remainder n 2) 0)
  );even?

(define (cube n)
  (* n n n)
  );cube

(define (simpson-cube-integral f a b n);a:begin num b:end num n:count 
  (define h (/ (- b a) n));h
  (define (next c)
    (+ c 1));next
  (define (multiplier c)
    (cond ((or (= c 0) (= c n)) 1)
	  ((even? c) 2)
	  (else 4)
	  );cond
    );multiplier
  (define (term c)
    (* (multiplier c)
       (f (+ a
	     (* h c)));f
       );*
    );term
  
  (* (/ h 3)
   (sum-iteration term (exact->inexact 0) next n) )

  );simpson-cube-integral

(simpson-cube-integral cube 0 1 100)
(simpson-cube-integral cube 0 1 1000)
