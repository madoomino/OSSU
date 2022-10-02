
;; cartesian-starter.rkt

; 
; PROBLEM:
; 
; In interactive games it is often useful to be able to determine the distance between two points on 
; the screen. We can describe those points using Cartesian coordinates as four numbers: x1, y1 and x2, y2. 
; The formula for the distance between those points is:
; .
; Use the How to Design Functions (HtDF) recipe to design a function called distance that consumes 
; four numbers representing two points and produces the distance between the two points.
; 
; Use (distance 3 0 0 4), which should produce 5 as your first example/test. Once your function works with 
; that test, try (distance 1 0 0 1) which should produce (sqrt 2). Read the error message carefully and use 
; the help desk to figure out how to use check-within for this case.
; 
; Remember, when we say DESIGN, we mean follow the recipe.
; 
; Leave behind commented out versions of the stub and template.
; 
; NOTE:
; 
; The signature for such a function is:
; 
; ;; Number Number Number Number -> Number
; 
; The template for such a function is:
; 
; ; (define (distance x1 y1 x2 y2)
; ;   (... x1 y1 x2 y2))

;; Solution

;; Number Number Number Number -> Number
;; produces the distance between the two points, each point represented by cartesian coordinates.

(check-expect (distance 3 0 0 4) 5)
(check-within (distance 1 0 0 1) (sqrt 2) 1.4142135623730951 ) ; hardest line till now :)

;(define (distance x1 y1 x2 y2) 2) ;stub
;(define (distance x1 y1 x2 y2) ;template
;  (...x1 y1 x2 y2))

(define (distance x1 y1 x2 y2)
  (sqrt(+(sqr(- x2 x1))(sqr(- y2 y1)))))
