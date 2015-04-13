#lang racket
;不动点+ 导数+ 牛顿法

(define dx 0.00001)

(define (cube x )
  (* x x x)
  );cube

(define (square x)
  (* x x));square

(define (derive g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx));lambda
  );derive

(define (newton-transform g)
  (lambda(x)
    (- x (/ (g x) ((derive g) x))));lambda
  );newton-transform

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess)
  );newtons-method

(define (sqrt x)
  (newtons-method (lambda (y) (- (square y) x))
		  1.0)
  );sqrt

(define (fixed-point f guess);cha zhao bu ding dian
  (define tolerance 0.00001)
  (define (average x y)
    (/ (+ x y) 2));average
  (define (abs x)
    (if (< x 0)
	(- x)
	x));abs
  (define (get-point x)
    (let ((result (f x)))
      (if (< (abs (- x result)) tolerance)
	  result
	  (get-point (average result x))
	  );if
      );let
    );get-point
  (get-point guess)
  );fixed-point

(sqrt 9)
