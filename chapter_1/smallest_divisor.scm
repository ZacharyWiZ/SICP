#lang racket

(define (smallest-divisor n b)
  (cond ((> (square b) n) n);n is a prime
	((= (remainder n b) 0) b)
	(else (smallest-divisor n (+ b 1)));else
   );cond
  );smallest-divisor

(define (square n)
  (* n n)
  );square

(smallest-divisor 199 2)
(smallest-divisor 1999 2)
(smallest-divisor 19999 2)

(/ 19999 7)
