#lang racket

(define (cont-frac N D k)
  (define (cf t)
    (if (= t 1)
	(/ (N t) (D t))
	(/ (N t) (+ (D t) (cf (- t 1))))
	);if
    );cf
  (cf k)
  );cont-frac

(define (cont-frac-iteration N D k)
  (define (cf result t)
    (if (= t k)
	result
	(cf (/ (N t) (+ (D t) result));/
	    (+ t 1));cf
	);if
    );cf
  (cf (/(N k) (D k)) 1)
  );cont-frac-iteration


(cont-frac (lambda(i) 1.0)
	   (lambda(i) 1.0)
	   10)

(cont-frac-iteration (lambda(i) 1.0)
	   (lambda(i) 1.0)
	   10)
