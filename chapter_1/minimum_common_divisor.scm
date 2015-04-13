#lang racket

(define (gbc-cc a b);a > b 
  (if (= b 0)
      a
      (gbc-cc b (remainder a b)));if
  );gbc get the minimum common divisor

(define (gbc a b)
  (if (< a b)
      (gbc-cc b a)
      (gbc-cc a b));if
  );define 

(gbc 10 2)
(gbc 19 1)
(gbc 19 2)
