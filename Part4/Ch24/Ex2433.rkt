;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2433) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 24.3.3
Develop a function wn-raise which, given two whole numbers m
and n, computes m to-the-power-of n.|#

;; wn-add : Natural Natural -> Natural
;; Given two naural numbers, produces their sum
(check-expect (wn-add 0 0) 0)
(check-expect (wn-add 0 1) 1)
(check-expect (wn-add 0 3) 3)
(check-expect (wn-add 1 0) 1)
(check-expect (wn-add 3 0) 3)
(check-expect (wn-add 3 8) 11)

(define (wn-add m n)
  (cond
    [(zero? n) m]
    [else (wn-add (add1 m) (sub1 n))]))

;; wn-mult : Natural Natural -> Natural
;; Given two natural numbers, produces their product
(check-expect (wn-mult 0  0)  0)
(check-expect (wn-mult 1  0)  0)
(check-expect (wn-mult 0  1)  0)
(check-expect (wn-mult 1  1)  1)
(check-expect (wn-mult 1  1)  1)
(check-expect (wn-mult 2  1)  2)
(check-expect (wn-mult 1  2)  2)
(check-expect (wn-mult 2  2)  4)
(check-expect (wn-mult 2  3)  6)
(check-expect (wn-mult 3  5) 15)
(check-expect (wn-mult 7  7) 49)
(check-expect (wn-mult 8 10) 80)

(define (wn-mult m n)
  (cond
    [(or (zero? m) (zero? n)) 0]
    [else (wn-add m (wn-mult m (sub1 n)))]))

;; wn-raise : Natural Natural -> Natural
;; Given two naturals, raises the first to the power of the second
(check-expect (wn-raise   0 0)     1)
(check-expect (wn-raise   0 1)     0)
(check-expect (wn-raise   1 0)     1)
(check-expect (wn-raise   5 0)     1)
(check-expect (wn-raise   5 1)     5)
(check-expect (wn-raise   1 2)     1)
(check-expect (wn-raise   1 5)     1)
(check-expect (wn-raise   2 2)     4)
(check-expect (wn-raise   3 2)     9)
(check-expect (wn-raise   3 3)    27)
(check-expect (wn-raise   5 5)  3125)

(define (wn-raise m n)
  (cond
    [(or (zero? n) (= 1 m)) 1]
    [else (wn-mult m (wn-raise m (sub1 n)))]))