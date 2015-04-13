#lang racket

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b));+
   );if
  );sum

(define (inc n)
  (+ n 1))

(define (cube n)
  (* n n n))

(define (sum-cubes a b)
  (sum cube a inc b)
  );sum-cubes

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx)
  );integral

(sum-cubes 1 10)

(integral cube 0 1 0.0001)
