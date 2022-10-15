(require 2htdp/image)

;; image-list-starter.rkt

;; =================
;; Data definitions:

; 
; PROBLEM A:
; 
; Design a data definition to represent a list of images. Call it ListOfImage. 
; 


;; ListOfImage is one of:
;; - empty
;; - (cons img ListOfImage)

(define LOI1 empty)
(define LOI2 (cons (circle 40 "solid" "red") empty))

#;
(define (fn-for-loi loi)
  (cond [(empty? loi) 0]
        [else
         (... (first loi)
              (fn-for-loi (rest loi)))]))

;; Template rules used:
;; one of: 2 cases:
;; - atomic distinct: empty
;; - compund: (cons img ListOfImages)
;; - atomic non-distinct: (fist loi) is Image
;; - self-reference: (rest loi) is ListOfImage

;; =================
;; Functions:

; 
; PROBLEM B:
; 
; Design a function that consumes a list of images and produces a number 
; that is the sum of the areas of each image. For area, just use the image's 
; width times its height.
; 


;; ListOfImage -> Number
;; produces a number that is the sum of the areas of each image

(check-expect (list-area empty) 0)
(check-expect (list-area (cons (rectangle 3 3 "solid" "red") empty)) 9)
(check-expect (list-area (cons (rectangle 6 6 "solid" "green") (cons (rectangle 10 5 "solid" "red") empty))) 86)

;(define (list-area loi) 0) ;stub


(define (list-area loi)
  (cond [(empty? loi) 0]
        [else
         (+ (* (image-height (first loi)) (image-width (first loi)))
              (list-area (rest loi)))]))
