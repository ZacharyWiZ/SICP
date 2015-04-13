#lang racket

(define (smallest-divisor n b)
  (cond ((> (square b) n) n)
	((= (remainder n b) 0) b)
	(else (smallest-divisor n (+ b 1)));else
   );cond
  );smallest-divisor

(define (prime? n)
  (= (smallest-divisor n 2)
     n);=
  );prime?

(define (square n)
  (* n n));square

(define (search-for-primes n)
  (if (prime? n) 
      (timed-prime-test n)
      (search-for-primes (+ n 1))
   );if
  );search-for-prime :just search the smallest num which bigger than n

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime))
  );timed-prime-test

(define (start-prime-test n start-time)
  (if (prime? n) 
      (report-prime (- (runtime) start-time))
   );if
  );start-prime-test

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  );report-prime
