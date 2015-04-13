#lang racket

(define (abs x)
  (if (< x 0)
      (- x)
      x)
  );abs

(define (newton-transform g)
  (define dx 0.000001)
  (define (deriv g)
    (lambda (x)
      (/ (- (g (+ x dx)) (g x)) dx)
	);lambda
    );deriv

  (lambda (x)
    (- x (/ (g x) ((deriv g)x))));lambda
  );newton-transform

(define (fixed-point f guess)
  (define tolerance 0.000001);¹«²î
  (define (get-point x)
    (let ((result (f x)))
      (if (< (abs(- result x)) tolerance)
	  result
	  (get-point (/ (+ result x) 2))
	 );if
      );let
    );get-point
  (get-point guess)
  );fixed-point

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess)
  );newtons-method

(define (cubic a b c)
  (lambda (x)
    (+ (* x x x)
       (* a x x)
       (* b x)
       c
     );+
    );lambda
  );cubic


(newtons-method (cubic 1 1 1) 0)
