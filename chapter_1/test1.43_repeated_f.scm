#lang racket

(define (repeated f n)
  (define (compare f1 f2)
    (lambda(x)
      (f1 (f2 x)));lambda
    );compare
  
  (define (doing result n)
    (if (= n 1)
	result
	(doing (compare result f)
	       (- n 1))
     );if
    );doing
  (doing f n)
  );repeated

;just use lambda
;recursive
(define (repeated-new-recursive f n)
  (define (iter-repeated result n)
    (if (= n 1)
	f
	(lambda(x) (f ((iter-repeated result (- n 1)) x)) );lambda
     );if
    );iter-repeated
  (iter-repeated f n)
  );repeated-new

;just use lambda
;iterative
(define (repeated-new-iterative f n)
  (define (iter result i)
    (if (= i 1)
	result
	(iter (lambda(x) (f (result x))
		);lambda 
	      (- i 1));iter
	);if
    );iter
  (iter f n)
  );repeated-new-iterative


(define (square x)
  (* x x)
  );square

((repeated square 2) 5)
((repeated-new-recursive square 2) 5)
((repeated-new-iterative square 2) 5)
