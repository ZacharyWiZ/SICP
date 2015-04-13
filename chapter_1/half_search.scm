#lang racket
;ÕÛ°ë²éÕÒ

(define (half-interval-method f a b)
  (let ((begin-value (f a))
	(end-value (f b))
	(mid (/ (+ a b) 2))
	(mid-value (f (/ (+ a b) 2)))
	);exp
    (cond ((close-enough? begin-value end-value)
	   mid)
          ((not-negative? (* begin-value mid-value))
	   (half-interval-method f a mid))
	  ((not-negative? (* end-value mid-value))
	   (half-interval-method f mid b))
	  (else
	   (error "Values are not of opposite sign " a b));else
     );cond
    );let
  );half-interval-method

(define (positive? x)
  (> x 0)
  );positive?

(define (negative? x)
  (< x 0)
  );negative?

(define (not-negative? x)
  (or (< x 0) (= x 0))
  );not-negative

(define (close-enough? a b)
  (< (abs (- a b)) 0.001)
  );close-enough?

(define (abs a)
  (if (< a 0)
      (- 0 a)
      a
   );if
  );abs

(half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3));lambda
		      1.0
		      2.0
		      )
(half-interval-method (lambda (x) (- (* x x) 9))
		      2.0
		      4.0
		      )

(sin 0)
