#lang racket

(define (cube-root x guess) 
  (if (good-enough guess (improve x guess))
      guess
      (cube-root x
		 (improve x
			  guess)
      )
  ))

(define (good-enough old-guess new-guess)
  (< (abs (- old-guess
	     new-guess))
     0.0001
     ))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (improve x guess)
  (/ (+ (/ x
	   (* guess guess))
	(* 2 guess))
     3))

(cube-root 8 1.0)
