#lang racket

(define tolerance 0.00001);公差

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance)
    );close-enough?
  (define (try guess)
    (let ((next (f guess)));exp
      (if (close-enough? guess next)
	  next
	  (try next)
	  );if
      );let
    );try guess
  (try first-guess)
  );first-guess

(define (abs x)
  (if (< x 0)
      (- x)
      x
      )
  );abs

(define (sqrt x)
  (fixed-point (lambda (y) (/(+ y (/ x y)) 2 ))
	       1.0)
  );sqrt

(sqrt 4)
(sqrt 9)



(define (golden-section-ratio);黄金分割率
  (fixed-point (lambda (y) (/ (+ y 1 (/ 1 y)) 2))
	       1.0)
  );golden-section-ratio

(golden-section-ratio)
