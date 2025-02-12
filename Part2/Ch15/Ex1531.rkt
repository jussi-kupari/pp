;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1531) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 15.3.1
; Develop a function choose-picture that takes in a string (either
; "basketball", "baseball", "Monopoly", etc. You can choose your
; own names if you wish, but don’t choose more than about five)
; and returns a picture of that object
; (which you should be able to find on the Web).

(require picturing-programs)


;; String -> Image
;; Given one of: "circle", "square", "text"
;; produces an image of the string
(check-expect (choose-picture "circle") (circle 20 "solid" "red"))
(check-expect (choose-picture "square") (square 20 "solid" "red"))
(check-expect (choose-picture "text") (text "TEXT" 20 "red"))

(define (choose-picture s)
  (cond
    [(string=? s "circle") (circle 20 "solid" "red")]
    [(string=? s "square") (square 20 "solid" "red")]
    [(string=? s "text") (text "TEXT" 20 "red")]))