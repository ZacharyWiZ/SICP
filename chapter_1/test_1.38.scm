#lang racket

(define (cont-frac N D k)
  (define (cf iter t)
    (let ((result (/ (N t) (+ (D t) iter)))
	  );exp
      (if (= t k)
	  result
	  (cf result (+ t 1))
	  )
      );let
    );cf
  (cf 0 1)
  );cont-frac

(define (cont-frac-recursive N D k)
  (if (= k 0)
      (/ (N k) (D k))
      (/ (N k) (+ (D k) (cont-frac-recursive N D (- k 1)) ))
      );if
  );cont-frac-recursive

(define (D t)
  (if (= (remainder (+ t 1) 3) 0)
      (* 2 (/ (+ t 1) 3))
      1
      );if
  );D

(cont-frac (lambda(i) 1.0)
	   D
	   100
	   )

(cont-frac-recursive (lambda(i) 1.0)
		     D
		     100)
