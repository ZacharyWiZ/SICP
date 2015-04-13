#lang racket
(define (sqrt-iter x guess)
  (if (good-enough? (improve x guess) guess)
      guess
      (sqrt-iter x
		 (improve x guess))
      ))

(define (good-enough? old-guess new-guess)
  (< (abs (- old-guess
	     new-guess))
     0.001))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (improve x guess)
  (average (/ x guess)
	   guess))

(define (average x y)
  (/ (+ x
	y)
     2))

(sqrt-iter 9 1.0)
