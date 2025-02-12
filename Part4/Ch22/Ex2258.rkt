;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2258) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 22.5.8
; Develop a function average that takes in a list of numbers and returns their average, i.e.
; their sum divided by how many there are. For this problem, you may assume there is at least
; one number in the list.

; Hint: Not every function on lists can best be written by following the templates...

;; -- Data Definition

;; LON (ListOfNumbers) is one of:
;; - (cons Number empty)
;; - (cons Number LON)
;; interp. a list of numbers

(define LON1 (cons 1 empty))
(define LON2 (cons 1 (cons 2 empty)))

;; template
#;
(define (fn-for-lon lon)
  (cond
    [(empty? (rest lon)) (first lon)]
    [else (... (first lon)
               (fn-for-lon (rest lon)))]))

;; -- Functions

;; average : LON -> Number
;; Given a LON, produces the average of the numbers
(check-expect (average (cons 1 empty)) 1)
(check-expect (average (cons 1 (cons 3 empty))) 2)
(check-expect (average (cons 2 (cons 3 (cons 4 empty)))) 3)

(define (average lon)
  (cond
    [(empty? (rest lon)) (first lon)]
    [else (/ (sum lon) (lon-length lon))]))

;; sum : LON -> Number
;; Given a LON, produces the sum of the numbers
(check-expect (sum (cons 1 empty)) 1)
(check-expect (sum (cons 1 (cons 2 empty))) 3)

(define (sum lon)
  (cond
    [(empty? (rest lon)) (first lon)]
    [else (+ (first lon) (sum (rest lon)))]))

;; length : LON -> Natural
;; Given a LON, produces the length of the LON
(check-expect (lon-length (cons 1 empty)) 1)
(check-expect (lon-length (cons 1 (cons 2 empty))) 2)
(check-expect (lon-length (cons 1 (cons 2 (cons 3 empty)))) 3)

(define (lon-length lon)
  (cond
    [(empty? (rest lon)) 1]
    [else (add1 (lon-length (rest lon)))]))