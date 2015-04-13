#lang racket

(define (average x y)
  (/ (+ x
	y)
     2))

(define (improve x guess)
  (average (/ x guess)
	   guess))

(define (sqrt-iter x guess)
  (if (good-enough? x guess)
      guess
      (sqrt-iter x 
		(improve x guess))
      ))

(define (good-enough? x guess)
  (< (abs(- x
	(* guess guess)))
     0.0001))

(define (abs x)
  (if (< x 0)
      (- x)
      x ))

(sqrt-iter 9 1.0)
