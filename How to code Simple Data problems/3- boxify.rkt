(require 2htdp/image)

;; boxify-starter.rkt

; 
; PROBLEM:
; 
; Use the How to Design Functions (HtDF) recipe to design a function that consumes an image, 
; and appears to put a box around it. Note that you can do this by creating an "outline" 
; rectangle that is bigger than the image, and then using overlay to put it on top of the image. 
; For example:
; 
; (boxify (ellipse 60 30 "solid" "red")) should produce box around the image.
; 
; Remember, when we say DESIGN, we mean follow the recipe.
; 
; Leave behind commented out versions of the stub and template.
; 


;; Solution

;; Image -> Image
;; Produces a new version of the image with a box around it.

(check-expect (boxify (ellipse 60 30 "solid" "red")))

;(define (boxify img) boxedImg) ;stub

;(define (boxify img)           ;template
; (...img))

(define (boxify img)
  (overlay (rectangle (image-width img) (image-height img) "outline" "black")
           img))

(boxify (ellipse 60 30 "solid" "red"))
