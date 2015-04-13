#lang racket

(define (f g)
  (g 2)
  );f

(define (square a)
  (* a a)
  );square

(f square)

(f (lambda (z) (* z (+ z 1))))

(f f)
