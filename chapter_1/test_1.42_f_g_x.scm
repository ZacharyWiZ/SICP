#lang racket 

(define (square x)
  (* x x)
  );square

(define (inc x)
  (+ x 1)
  );inc

(define (compose f g)
  (lambda (x)
   (f (g x))
    );lambda
  );compose


((compose square inc) 6)
