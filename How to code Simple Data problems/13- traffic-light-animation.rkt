(require 2htdp/image)
(require 2htdp/universe)

;; traffic-light-starter.rkt

; 
; PROBLEM:
; 
; Design an animation of a traffic light. 
; 
; Your program should show a traffic light that is red, then green, 
; then yellow, then red etc. For this program, your changing world 
; state data definition should be an enumeration.
; 
; Here is what your program might look like if the initial world 
; state was the red traffic light:
; .
; Next:
; .
; Next:
; .
; Next is red, and so on.
; 
; To make your lights change at a reasonable speed, you can use the 
; rate option to on-tick. If you say, for example, (on-tick next-color 1) 
; then big-bang will wait 1 second between calls to next-color.
; 
; Remember to follow the HtDW recipe! Be sure to do a proper domain 
; analysis before starting to work on the code file.
; 
; Note: If you want to design a slightly simpler version of the program,
; you can modify it to display a single circle that changes color, rather
; than three stacked circles. 
; 


(require 2htdp/image)
(require 2htdp/universe)

;; Traffic light animation program 
;; (main RED)
;; =================
;; Constants:
(define WIDTH 100)
(define HEIGHT 200)
(define CIRCLE-DIAMITER 30)

(define MTS (empty-scene WIDTH HEIGHT "black"))

(define RED (above (circle CIRCLE-DIAMITER "solid" "red")
       (circle CIRCLE-DIAMITER "outline" "yellow")
       (circle CIRCLE-DIAMITER "outline" "green")))

(define YELLOW (above (circle CIRCLE-DIAMITER "outline" "red")
       (circle CIRCLE-DIAMITER "solid" "yellow")
       (circle CIRCLE-DIAMITER "outline" "green")))

(define GREEN (above (circle CIRCLE-DIAMITER "outline" "red")
       (circle CIRCLE-DIAMITER "outline" "yellow")
       (circle CIRCLE-DIAMITER "solid" "green")))

;; =================
;; Data definitions:

;; TrafficLight is Image
;; interp. An simulation of the traffic light by animation

(define TR1 RED)
(define TR2 GREEN)
(define TR3 YELLOW)

#;
(define (fn-for-traffic-light tr)
  (... tr))

;; Template rules used:
;; - atomic non-distinct value: Image


;; =================
;; Functions:

;; TrafficLight -> TrafficLight
;; start the world with initial state tr, i.g. (main RED)
;; 
(define (main TrafficLight)
  (big-bang TrafficLight                      ; TrafficLight
            (on-tick   advance-taffic-light 1); TrafficLight -> TrafficLight
            (to-draw   render) ))             ; TrafficLight -> Image

;; TrafficLight -> TrafficLight
;; produce the next traffic light colors
(check-expect (advance-taffic-light RED) GREEN)
(check-expect (advance-taffic-light GREEN) YELLOW)
(check-expect (advance-taffic-light YELLOW) RED)

;<use template from TrafficLight>

(define (advance-taffic-light tr)
  (cond [(image=? tr RED) GREEN]
        [(image=? tr GREEN) YELLOW]
        [else RED]))


;; TrafficLight -> Image
;; render the next color 
(check-expect (render RED) (overlay RED MTS))
(check-expect (render GREEN) (overlay GREEN MTS))
(check-expect (render YELLOW) (overlay YELLOW MTS))

;<use template from TrafficLight>

(define (render tr)
  (overlay tr MTS))
