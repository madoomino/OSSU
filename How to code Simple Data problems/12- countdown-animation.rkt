;; countdown-animation starter.rkt



(require 2htdp/image)
(require 2htdp/universe)

;; Countdown Program to countdown to zero

;; =================
;; Constants:

(define HEIGHT 100)
(define WIDTH 100)
(define MTS (empty-scene WIDTH HEIGHT))
(define CTR-X (/ HEIGHT 2))
(define CTR-Y (/ WIDTH 2))
(define COUNT-SPEED 1); INTEGER
(define SUBSTRACTED-NUMBER 1); INTEGER
(define TEXT-SIZE 48)
(define TEXT-COLOR "black")

;; =================
;; Data definitions:

;; CountDown is Natural(0, n) ;n -> Natural
;; interp. The number to start counting down from
;<examples are redundant from CountDown>

#;
(define (fn-for-count-down cd)
  (... cd))

;; Template rules used:
;; - atomic non-distinct: Natural(0, n) ;n -> Natural


;; =================
;; Functions:

;; Countdown -> Countdown
;; called to start the animation, start the program with (main -the number you want-)
;; 
(define (main c)
  (big-bang c                                            ; Countdown
            (on-tick   decrease-number (/ 1 COUNT-SPEED)); Countdown -> Countdown
            (to-draw   render)))                         ;Countdown -> Image

;; Countdown -> Countdown
;; produce the previous number
(check-expect (decrease-number 10) (- 10 SUBSTRACTED-NUMBER))
(check-expect (decrease-number 0) 0)
(check-expect (decrease-number -1) 0)

;(define (decrease-number c) ;stub
;  (... c))

;<use template from Countdown>

(define (decrease-number c)
  (if (> c 0)
      (- c SUBSTRACTED-NUMBER)
      0))


;; Countdown -> Image
;; render the previous number every second

(check-expect (render 10) (overlay (text (number->string 10) TEXT-SIZE TEXT-COLOR)
         MTS))

;(define (render c) ;stub
; (... c))

;<use template from CountDown>

;; First Approach (My Preferential):
(define (render c)
  (overlay (text (number->string c) TEXT-SIZE TEXT-COLOR)
         MTS))

;; Second Approach:
#;
(define (render c)
  (place-image (text (number->string c) TEXT-SIZE TEXT-COLOR)
               CTR-X CTR-Y
               MTS))
