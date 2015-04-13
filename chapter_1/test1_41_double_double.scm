#lang racket

(define (double f)
  (lambda (x)
    (f (f x))
    );lambda
  );double

(define ((double1 f) x)
  (f (f x))
  )

(define (inc x)
  (+ x 1)
  );inc

(((double (double double))inc )5)


(((double1 (double1 double1)) inc) 0 )
