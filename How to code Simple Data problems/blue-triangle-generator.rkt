(require 2htdp/image)
;; blue-triangle-starter.rkt

; PROBLEM:
; 
; Design a function that consumes a number and produces a blue solid triangle of that size.
; 
; You should use The How to Design Functions (HtDF) recipe, and your complete design should include
; signature, purpose, commented out stub, examples/tests, commented out template and the completed function.


;; Number -> Image
;; Produces an image of a triangle based on the given number
(check-expect (blueTriangleGenerator 10) .)
(check-expect (blueTriangleGenerator 100) .)
;(define (blueTriangleGenerator num) (triangle 10 "solid" "blue")) ;stub

;(define (blueTriangleGenerator num) ;template
;  (...num))

(define (blueTriangleGenerator num)
  (triangle num "solid" "blue"))
