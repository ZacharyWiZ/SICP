#lang racket
;product doing the multiplation
(define (product term a next b)
  (if (< b a)
      1
      (* (term a)
	 (product term (next a) next b))
   );if
  );product

(define (product-iteration term a next b)
  (define (iteration a result)
    (if (< b a)
	result
	(iteration (next a) 
		   (* result (term a));*
		   );iteration
	);if
    );iteration
  (iteration a 1)
  );product-iteration


(define (get-pi n)
  (define a 1.0)
  (define (odd-num c) 
    (+ 1 (* 2 c));+
    );odd-num
  (define (even-num c)
    (* c 2));even-num
  (define (term1 c)
    (/ (even-num c)
       (odd-num c));/
    );term1
  (define (term2 c)
    (/ (+ 1 (odd-num c))
       (odd-num c));/
    );term2
  (define (next c)
    (+ c 1));next
  
  (* 4
     (product-iteration term1 a next n)
     (product-iteration term2 a next n))
    );get-pi

(get-pi 1000)
(get-pi 10000)
