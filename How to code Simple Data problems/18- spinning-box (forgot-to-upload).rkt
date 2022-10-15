(require 2htdp/image)
(require 2htdp/universe)

;; spinning-starter.rkt

; 
; PROBLEM:
; 
; Design a world program as follows:
; 
; The world starts off with a small square at the center of the screen. As time 
; passes, the square stays fixed at the center, but increases in size and rotates 
; at a constant speed.Pressing the spacebar resets the world so that the square 
; is small and unrotated.
; 
; Starting display:
; .
; After a few seconds:
; .
; After a few more seconds:
; .
; Immediately after pressing the spacebar:
; .
; NOTE 1: Remember to follow the HtDW recipe! Be sure to do a proper domain 
; analysis before starting to work on the code file.
; 
; NOTE 2: The rotate function requires an angle in degrees as its first 
; argument. By that it means Number[0, 360). As time goes by the box may end up 
; spinning more than once, for example, you may get to a point where it has spun 
; 362 degrees, which rotate won't accept. One solution to that is to use the 
; remainder function as follows:
; 
; (rotate (remainder ... 360) (text "hello" 30 "black"))
; 
; where ... can be an expression that produces any positive number of degrees 
; and remainder will produce a number in [0, 360).
; 
; Remember that you can lookup the documentation of rotate if you need to know 
; more about it.
; 
; NOTE 3: There is a way to do this without using compound data. But you should 
; design the compound data based solution.
; 


;; Spinning Box Animation

;; =================
;; Constants:

(define WIDTH 500)
(define HEIGHT 500)
(define MTS (empty-scene WIDTH HEIGHT))
(define CTR-Y (/ HEIGHT 2))
(define CTR-X (/ WIDTH 2))
(define COLOR "red")
(define GROWTH-SPEED 2)
(define ROTATIONAL-SPEED 2)


;; =================
;; Data definitions:

(define-struct box (side angle))

;; Box is ( make-box String Natural Natural[0, 360) )
;; interp. a box with side length box-side and rotation angle (remainder box-angle 360).

(define B1 (make-box 4 90))
(define B2 (make-box 8 360))
(define B3 (make-box 12 0))

#;
(define (fn-for-box b)
  (... box-side)   ; Natural
  (... box-angle)) ; Natrual[0, 360)

;; ================= 
;; Functions:

;; Box -> Box
;; called to initiate a growing and rotating square, Start world with (main (make-box COLOR 0 0))
;; 
(define (main b)                                      
  (big-bang b                             ; Box
            (on-tick   next-box)          ; Box -> Box
            (to-draw   render-box) ; Box -> Image
            (on-key    handle-key)))      ; Box KeyEvent -> Box


;; Box -> Box
;; produce the next box with bigger size and bigger angle every second
(check-expect (next-box (make-box 5 65)) (make-box (+ 5 GROWTH-SPEED) (+ ROTATIONAL-SPEED 65)))

;(define (next-box b) b) ;stub

;took template from Box

(define (next-box b)
  (make-box (+ (box-side b) GROWTH-SPEED)
            (+ (box-angle b) ROTATIONAL-SPEED)))


;; Box -> Image
;; render the box with color, side length and rotational angle.
(check-expect (render-box (make-box 20 40)) (place-image (rotate (remainder 40 360)
                       (square 20 "solid" COLOR))
                       CTR-X CTR-Y MTS))
                          
(define (render-box b)
  (place-image (rotate (remainder (box-angle b) 360)
                       (square (box-side b) "solid" COLOR))
                       CTR-X CTR-Y MTS))


;; Box KeyEvent -> Box

(define (handle-key b ke)
  (cond [(key=? ke " ") (make-box 0 0)]))
