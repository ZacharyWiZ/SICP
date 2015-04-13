#lang racket

(define (factorial n)
  (iter 1 1 n))

(define (iter product counter max-counter)
  (if (> counter max-counter)
      product
      (iter (* product counter)
	    (+ counter 1)
	    max-counter);;
   )

  )

(factorial 2)
