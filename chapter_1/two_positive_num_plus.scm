#lang racket
(define (plus a b)
 (if (= a 0)
     b
     (inc (plus (dec a) b
	     );plus
	  );inc
     );if
  );define

(define (inc a)
  (+ a 1))

(define (dec a)
  (- a 1))

(plus 2 3)
