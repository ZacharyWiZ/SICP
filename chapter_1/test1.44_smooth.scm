#lang racket

(define (smooth f)
  (define dx 0.00001)
  (lambda(x) (/ (+ (f x)
		   (f (- x dx))
		   (f (+ x dx)))
		3)
    );lambda
  );smooth

(define (smooth-time-n f n)
  (define (iter-n n)
    (if (= n 1)
	f
	(lambda(x)
	  (f ((iter-n (- n 1)) x) ) );lambda
	);if
    );iter-n
  (iter-n n)
  );smooth-time-n

;(define (smooth-time-n-new f n)
;  (if (= n 1)
;     f
;     (f (smooth-time-n-new f (- n 1))));if
;  );smooth-time-n-new

(define (square x)
  (* x x)
  );square

(((smooth-time-n smooth 5) square) 2)
(((smooth-time-n-new smooth 5) square) 2)
