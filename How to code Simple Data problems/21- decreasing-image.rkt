(require 2htdp/image)

;; decreasing-image-starter.rkt

;  PROBLEM:
;  
;  Design a function called decreasing-image that consumes a Natural n and produces an image of all the numbers 
;  from n to 0 side by side. 
;  
;  So (decreasing-image 3) should produce (image with 3210 value). 


;; Natural -> Image
;; produces an image of all the numbers from n to 0 side by side

(check-expect (decreasing-image 0) (text "0" 24 "black"))
(check-expect (decreasing-image 3) (text "3210" 24 "black"))
(check-expect (decreasing-image 4) (text "43210" 24 "black"))

;(define (decreasing-image n) (text "0" 24 "black")) ;stub

(define (decreasing-image n)
  (cond [(zero? n) (text "0" 24 "black")]
        [else
         (beside
          (text (number->string n) 24 "black")
          (decreasing-image (- n 1)))]))
